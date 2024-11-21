import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:outernet/data/models/sites/site_response_model.dart';
import 'package:outernet/data/models/sites/site_review_response_model.dart';
import 'package:outernet/presentation/helper_widgets/custom_popup.dart';
import 'package:outernet/presentation/ui_component_resused/review_card.dart';
import 'package:outernet/presentation/blocs/site_bloc/site_bloc.dart';
import 'package:outernet/presentation/blocs/site_bloc/site_event.dart';
import 'package:outernet/presentation/blocs/site_bloc/site_state.dart';

class ReviewPart extends StatelessWidget {
  final SiteResponseModel siteDetail;
  final SiteReviewResponseModel siteReview;

  const ReviewPart({super.key, required this.siteDetail, required this.siteReview});

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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      child: Container(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
        margin: const EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: _reviewBox(context, siteDetail, siteReview),
      ),
    );
  }

  Widget _reviewBox(BuildContext context, SiteResponseModel siteDetail, SiteReviewResponseModel siteReview) {
    return FutureBuilder<Map<String, dynamic>>(
      future: _fetchSiteComment(context), 
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
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
            ),
            const SizedBox(width: 20),
          ],
        ),
      ],
    );
  }
}