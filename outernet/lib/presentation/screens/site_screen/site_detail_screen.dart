import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:outernet/data/models/sites/site_request_model.dart';
import 'package:outernet/data/models/sites/site_response_model.dart';
import 'package:outernet/data/models/sites/site_review_response_model.dart';
import 'package:outernet/env/config.dart';
import 'package:outernet/env/log_service.dart';
import 'package:outernet/presentation/blocs/site_bloc/site_bloc.dart';
import 'package:outernet/presentation/blocs/site_bloc/site_event.dart';
import 'package:outernet/presentation/blocs/site_bloc/site_state.dart';
import 'package:outernet/presentation/helper_widgets/custom_popup.dart';
import 'package:outernet/presentation/module_provider/init_injections.dart';
import 'package:outernet/presentation/screens/asset_links.dart';
import 'package:outernet/presentation/themes.dart';
import 'package:outernet/presentation/ui_component_resused/amenity_card.dart';
import 'package:outernet/presentation/ui_component_resused/images_carousel.dart';
import 'package:outernet/presentation/ui_component_resused/props_rating_slide.dart';
import 'package:outernet/presentation/ui_component_resused/rating_bar.dart';
import 'package:outernet/presentation/ui_component_resused/review_card.dart';
import 'package:readmore/readmore.dart';

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
        state.isSiteDetailChanged = false;
        return {
          'siteDetail': state.siteDetail,
          'siteReview': state.siteReview,
        };
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
            final siteDetail = snapshot.data!['siteDetail'] as SiteResponseModel;
            final siteReview = snapshot.data!['siteReview'] as SiteReviewResponseModel?;
            return _buildSiteDetail(context, siteDetail, siteReview);
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }

  Widget _buildSiteDetail(BuildContext context, SiteResponseModel siteDetail, SiteReviewResponseModel? siteReview) {
    final imageList = [mikazuki1, mikazuki2, mikazuki3];
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildImageCarousel(imageList),
            //introduce part
            _buildIntroducePart(context, siteDetail, siteReview!),
            _buildReviewPart(context, siteDetail, siteReview)
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

  // Introduce part
  Widget _buildIntroducePart(BuildContext context, SiteResponseModel siteDetail, SiteReviewResponseModel siteReview) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildRatingBar(siteDetail, siteReview),
          const SizedBox(height: 10),
          if (siteDetail.siteType != null && siteDetail.siteType?.name != null)
            Text(siteDetail.siteType!.name!, style: AppTextStyles.body1Semibold),
          const SizedBox(height: 10),
          _buildLocation(siteDetail),
          _buildDescription(siteDetail, siteReview),
          _buildMap(siteDetail),
        ],
      ),
    );
  }

  Row _buildRatingBar(SiteResponseModel siteDetail, SiteReviewResponseModel siteReview) {
    return Row(
      children: [
        RatingBar(
          onRatingChanged: (rating) => {},
          initialRating: siteDetail.averageRating ?? 4.5,
          size: 20,
          isInteractive: false,
        ),
        const SizedBox(width: 10),
        Text(siteDetail.averageRating?.toString() ?? 'NaN', style: AppTextStyles.title1Regular.copyWith(fontSize: 16),),
        const SizedBox(width: 10),
        // vertial divider
        Container(
          height: 20,
          width: 1,
          color: const Color.fromARGB(255, 37, 37, 37),
        ),
        const SizedBox(width: 10,),
        Text('${siteReview.data?.length?? 0} đánh giá', style: AppTextStyles.body1Regular.copyWith(fontSize: 16),),
      ],
    );
  }

  Widget _buildLocation(SiteResponseModel siteDetail) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(Iconsax.location, size: 20),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            siteDetail.resolvedAddress ?? '',
            style: AppTextStyles.body1Regular.copyWith(height: 1.5),
            softWrap: true,
          ),
        ),
      ],
    );
  }

  Widget _buildDescription(SiteResponseModel siteDetail, SiteReviewResponseModel siteReview) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: _descriptionBox(siteDetail, siteReview),
    );
  }

  Widget _descriptionBox(SiteResponseModel siteDetail, SiteReviewResponseModel siteReview) {
    final ratings = [
      // siteDetail.fiveStarRating ?? 5,
      // siteDetail.fourStarRating ?? 4,
      // siteDetail.threeStarRating ?? 3,
      // siteDetail.twoStarRating ?? 2,
      // siteDetail.oneStarRating ?? 1,
      5, 4, 3, 2, 1
    ];
    final amenities = siteDetail.groupedServices?? [];
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Giới thiệu địa điểm', style: AppTextStyles.heading1Semibold,),
        const SizedBox(height: 10),
        _descriptionRatingPart(siteDetail, siteReview, ratings),
        const SizedBox(height: 20),
        const Divider(),
        const SizedBox(height: 20),
        //Text(siteDetail.description ?? '', style: AppTextStyles.body1Regular.copyWith(height: 1.5),),
        _descriptionDescriptionPart(),
        const SizedBox(height: 20,),
        _descriptionAmenitiesPart(amenities)
      ],
    );
  }

  Container _descriptionAmenitiesPart(List<GroupedService> amenities) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Iconsax.archive_add),
              SizedBox(width: 10,),
              Text('Tiện ích đi kèm', style: AppTextStyles.body1Semibold,)
            ],
          ),
          const SizedBox(height: 10),
          if (amenities.isNotEmpty)
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: amenities.first.services?.map((service) => Text(service.serviceName ?? '')).toList() ?? [],
            ),
          if (amenities.isEmpty)
            const Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [Text('Không có tiện ích đi kèm'), Text('Không có tiện ích đi kèm'), Text('Không có tiện ích đi kèm')],
            ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () => {},
                  child: const Text('Xem tất cả'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  ReadMoreText _descriptionDescriptionPart() {
    return ReadMoreText(
      ConfigManager().config.siteDescription,
      trimLines: 3,
      colorClickableText: AppColors.primary,
      trimMode: TrimMode.Line,
      trimCollapsedText: 'xem đầy đủ',
      trimExpandedText: 'rút gọn',
      style: AppTextStyles.body1Regular.copyWith(height: 1.5),
    );
  }

  Row _descriptionRatingPart(SiteResponseModel siteDetail, SiteReviewResponseModel siteReview, List<int> ratings) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(siteDetail.averageRating?.toString() ?? 'NaN', style: AppTextStyles.heading1Semibold.copyWith(fontSize: 36),),
                  const SizedBox(width: 10),
                  const Icon(Iconsax.star, size: 30, color: AppColors.primary,),
                ],
              ),
              const SizedBox(height: 10),
              Text('${siteReview.data?.length?? 0} đánh giá', style: AppTextStyles.body1Regular,),
            ],
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: ratings.length,
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            itemBuilder: (context, index) {
              return Row(
                children: [
                  RatingSlider(rating: ratings[index].toDouble()),
                  const SizedBox(width: 15),
                  Text('${ratings[index]}', style: AppTextStyles.heading2Regular),
                ],
              );
            },
          ),
        ),
      ],
    );
  }

  // Map part

  Widget _buildMap(SiteResponseModel siteDetail) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 25),
          const Text('Địa chỉ và thông tin liên hệ', style: AppTextStyles.heading2Semibold,),
          const SizedBox(height: 10),
          Container(
            child: Placeholder(
              fallbackHeight: 200,
              child: Image.asset(mapPlaceholder, fit: BoxFit.cover, width: double.infinity, height: 200,),
            ),
          ),
          const SizedBox(height: 15),
          _buildLocation(siteDetail),
          const SizedBox(height: 5),
          _buildWebsite(siteDetail),
          const SizedBox(height: 5),
          _buildContact(siteDetail)
        ],
      ),
    );
  }

  Widget _buildWebsite(SiteResponseModel siteDetail) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(Iconsax.global, size: 20,),
        const SizedBox(width: 10),
        if (siteDetail.website != null && siteDetail.website!.isNotEmpty)
          Expanded(
            child: Text(
              siteDetail.website!,
              style: AppTextStyles.body1Regular.copyWith(height: 1.5),
              softWrap: true,
            ),
          ),
        if (siteDetail.website == null || siteDetail.website!.isEmpty)
          Expanded (
            child: Text(
              'Nơi này hiện chưa được liên kết với bất kì website nào.', 
              style: AppTextStyles.body1Regular.copyWith(height: 1.5), 
              softWrap: true
            )
          ),
      ],
    );
  }

  Widget _buildContact(SiteResponseModel siteDetail) {
    final listPhoneNumber = siteDetail.phoneNumbers ?? [];
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(Iconsax.call, size: 20),
        const SizedBox(width: 10),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (final phoneNumber in listPhoneNumber)
                Text(
                  phoneNumber,
                  style: AppTextStyles.body1Regular.copyWith(height: 1.5),
                  softWrap: true,
                ),
            ],
          ),
        ),
      ],
    );
  }

  // Review part
  Widget _buildReviewPart(BuildContext context, SiteResponseModel siteDetail, SiteReviewResponseModel siteReview) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 20, 0, 20),
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: _reviewBox(context, siteDetail, siteReview),
    );
  }

  Future<Map<String, dynamic>> _fetchSiteComment(BuildContext context) async {
    final siteBloc = context.read<SiteBloc>();
    if (siteBloc.state is LoadListSiteSuccess && (siteBloc.state as LoadListSiteSuccess).isSiteReviewChanged == true) {
      (siteBloc.state as LoadListSiteSuccess).isSiteReviewChanged = false;
      return {
        'siteReview': (siteBloc.state as LoadListSiteSuccess).siteReview,
      };
    }

    final siteId = (siteBloc.state as LoadListSiteSuccess).siteDetail.siteId ?? 4;
    siteBloc.add(GetSiteReview(siteId));

    await for (final state in siteBloc.stream) {
      if (state is LoadListSiteSuccess && state.isSiteReviewChanged == true) {
        state.isSiteReviewChanged = false;
        return {
          'siteReview': state.siteReview,
        };
      } else if (state is LoadListSiteFailed) {
        throw Exception(state.message);
      }
    }

    throw Exception('Failed to load site reviews');
  }

  Widget _reviewBox(BuildContext context, SiteResponseModel siteDetail, SiteReviewResponseModel siteReview) {
    return FutureBuilder<Map<String, dynamic>>(
      future: _fetchSiteComment(context), 
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return _buildDefaultImageCarousel();
        } else if (snapshot.hasError) {
          return Center(
            child: CustomPopup(
              title: 'Chi tiết địa điểm',
              content: 'Không thể tải nhận xét từ người dùng.\nMã lỗi: ${snapshot.error}',
              confirmText: 'Đóng',
              onConfirm: () => Navigator.of(context).pop(),
              showAction: false,
              onReturn: () => Navigator.of(context).pop(),
            ),
          );
        } else if (snapshot.hasData) {
          final siteReview = snapshot.data!['siteReview'] as SiteReviewResponseModel?;
          return _buildSiteReview(siteDetail, siteReview!);
        } else {
          return const SizedBox.shrink();
        }
      }
    );
  }

  Widget _buildSiteReview(SiteResponseModel siteDetail, SiteReviewResponseModel siteReview) {
    if (siteReview.data == null || siteReview.data!.isEmpty) {
      return const Center(
        child: Text('Ở đây hơi trống trải, quay lại sau bạn nhé!'),
      );
    }

    return Column(
      children: [
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return ReviewCard(
              review: siteReview.data![index],
              isFavorite: true,
            );
          }, 
          separatorBuilder: (context, index) => const SizedBox(height: 20, child: Divider()), 
          itemCount: siteReview.data!.length
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () => {},
                child: const Text('Xem tất cả đánh giá'),
              ),
            )
          ],
        )
      ],
    );
  }

  // Neareby site part
  Future<Map<String, dynamic>> _fetchSiteNearby(BuildContext context, GetSiteRequestModel request) async {
    final siteBloc = context.read<SiteBloc>();
    if (siteBloc.state is LoadListSiteSuccess && (siteBloc.state as LoadListSiteSuccess).isSiteByLocChanged == true) {
      (siteBloc.state as LoadListSiteSuccess).isSiteByLocChanged = false;
      return {
        'siteByLoc': (siteBloc.state as LoadListSiteSuccess).siteByLoc,
      };
    }

    siteBloc.add(GetSiteByLocation(request));

    await for (final state in siteBloc.stream) {
      if (state is LoadListSiteSuccess && state.isSiteByLocChanged == true) {
        state.isSiteByLocChanged = false;
        return {
          'siteByLoc': state.siteByLoc,
        };
      } else if (state is LoadListSiteFailed) {
        throw Exception(state.message);
      }
    }

    throw Exception('Failed to load site nearby');
  }

  
}