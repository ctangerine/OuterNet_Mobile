import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:outernet/domain/entities/review_entity.dart';
import 'package:outernet/domain/entities/site_entity.dart';
import 'package:outernet/env/log_service.dart';
import 'package:outernet/presentation/blocs/site_bloc/site_bloc.dart';
import 'package:outernet/presentation/blocs/site_bloc/site_event.dart';
import 'package:outernet/presentation/blocs/site_bloc/site_state.dart';
import 'package:outernet/presentation/helper_widgets/custom_popup.dart';
import 'package:outernet/presentation/module_provider/init_injections.dart';
import 'package:outernet/presentation/screens/asset_links.dart';
import 'package:outernet/presentation/screens/site_screen/site_detail/site_detail_review_part.dart';
import 'package:outernet/presentation/screens/site_screen/site_detail/site_detail_site_nearby_part.dart';
import 'package:outernet/presentation/screens/site_screen/site_detail/site_detail_introduce_part.dart';
import 'package:outernet/presentation/ui_component_resused/images_carousel.dart';

class SiteDetailScreen extends StatelessWidget {
  const SiteDetailScreen({super.key});

  @override 
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SiteBloc>(
          create: (context) {
            try {
              return context.read<SiteBloc>();
            } catch (e) {
              return sl<SiteBloc>();
            }
          },
        )
      ],
      child: const SiteDetailScreenContent(),
    );
  }
}


class SiteDetailScreenContent extends StatelessWidget {
  const SiteDetailScreenContent({super.key});

  Future<Map<String, dynamic>> _fetchSiteDetail(BuildContext context) async {
    final siteBloc = context.read<SiteBloc>();
    siteBloc.add(LoadSiteDetail(4));

    await for (final state in siteBloc.stream) {
      if (state is LoadListSiteSuccess && state.isSiteDetailChanged == true) {
        //state.isSiteDetailChanged = false;
        final siteDetail = state.siteDetail;

        siteBloc.add(GetSiteReview(siteDetail.siteId ?? 4));

        await for (final reviewState in siteBloc.stream) {
          if (reviewState is LoadListSiteSuccess && reviewState.isSiteReviewChanged == true) {
            reviewState.isSiteReviewChanged = false;
            return {
              'siteDetail': siteDetail,
              'siteReview': reviewState.siteReview,
            };
          } else if (reviewState is LoadListSiteFailed) {
            throw Exception(reviewState.message);
          }
        }
      } else if (state is LoadListSiteFailed) {
        throw Exception(state.message);
      }
    }

    throw Exception('Failed to load site details');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(onPressed: () => Navigator.of(context).pop(), icon: const Icon(Iconsax.arrow_left_2)),
        actions: const [
          Icon(Iconsax.send_1),
          SizedBox(width: 10),
          Icon(Iconsax.heart),
          SizedBox(width: 10),
        ],
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: _fetchSiteDetail(context),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return _buildDefaultImageCarousel();
          } else if (snapshot.hasError) {
            return Center(
              child: CustomPopup(
                title: 'Chi tiết địa điểm',
                content: 'Không thể tải thông tin chi tiết địa điểm.\nMã lỗi: ${snapshot.error}',
                confirmText: 'Đóng',
                onConfirm: () => Navigator.of(context).pop(),
                showAction: false,
                onReturn: () => Navigator.of(context).pop(),
              ),
            );
          } else if (snapshot.hasData) {
            final siteDetail = snapshot.data!['siteDetail'] as SiteEntity;
            final siteReview = snapshot.data!['siteReview'] as List<ReviewEntity>?;
            return _buildSiteDetail(context, siteDetail, siteReview);
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }

  Widget _buildSiteDetail(BuildContext context, SiteEntity siteDetail, List<ReviewEntity>? siteReview) {
    final imageList = [mikazuki1, mikazuki2, mikazuki3];
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildImageCarousel(imageList),
            //introduce part
            IntroducePart(siteDetail: siteDetail, siteReview: siteReview!),
            ReviewPart(siteDetail: siteDetail, siteReview: siteReview),
            SiteNearbyPart(siteDetail: siteDetail, siteReview: siteReview),
          ],
        ),
      ),
    );
  }

  Widget _buildImageCarousel(List<String> imageList) {
    LogService().logger.i('SiteDetailScreen: building image carousel');
    return ImagesCarousel(
      images: imageList, 
      defaultImage: mikazuki1,
      width: 1000,
      height: 300,
      fit: BoxFit.fitWidth,
      viewportFraction: 1,
      isEnlarge: true,
      isMargin: false,
      isBorder: false,
    );
  }

  Widget _buildDefaultImageCarousel() {
    LogService().logger.i('SiteDetailScreen: building default image carousel');
    return const ImagesCarousel(
      images: [mikazuki1],
      defaultImage: mikazuki1,
      width: 1000,
      height: 300,
      fit: BoxFit.fitWidth,
      viewportFraction: 1,
      isEnlarge: true,
      isMargin: false,
      isBorder: false,
    );
  }
}