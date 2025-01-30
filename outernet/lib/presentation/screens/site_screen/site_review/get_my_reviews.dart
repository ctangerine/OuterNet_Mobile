import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:outernet/data/data_sources/dio_network/dio_network.dart';
import 'package:outernet/domain/entities/media_entity.dart';
import 'package:outernet/domain/entities/site_entity.dart';
import 'package:outernet/presentation/blocs/site_bloc/site_bloc.dart';
import 'package:outernet/presentation/blocs/site_bloc/site_state.dart';
import 'package:outernet/presentation/blocs/site_review_bloc/site_review_bloc.dart';
import 'package:outernet/presentation/blocs/site_review_bloc/site_review_event.dart';
import 'package:outernet/presentation/blocs/site_review_bloc/site_review_state.dart';
import 'package:outernet/presentation/helper_widgets/image_handler.dart';
import 'package:outernet/presentation/module_provider/init_injections.dart';
import 'package:outernet/presentation/screens/asset_links.dart';
import 'package:outernet/presentation/themes.dart';

class MyReviewPage extends StatelessWidget {
  const MyReviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<SiteReviewBloc>()..add(GetMyReview()),
      child: Builder(
        builder: (context) {
          return _buildContent();
        }
      ),
    );
  }

  Scaffold _buildContent() {
    return Scaffold(
      appBar: AppBar(
        // title: const Text("Đánh giá của tôi về các địa điểm"),
        backgroundColor: AppColors.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<SiteReviewBloc, SiteReviewState>(
          builder: (context, state) {
            if (state is SiteReviewFetchSuccess) {
              if (state.isRecentlyGetMyReview == true) {
                final reviews = state.sites; // Giả sử danh sách đánh giá là state.reviews
                logger.d(reviews.map((e) => e.toJson()).toList());
                if (reviews.isEmpty) {
                  return const Center(
                    child: Text(
                      'Bạn chưa có đánh giá nào.',
                      style: AppTextStyles.body1Regular,
                    ),
                  );
                }
                return ListView.builder(
                  itemCount: reviews.length,
                  itemBuilder: (context, index) {
                    return _buildReviewCard(reviews[index], context);
                  },
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            } else {
              return const Center(
                child: Text(
                  'Đã xảy ra lỗi. Vui lòng thử lại sau.',
                  style: AppTextStyles.body1Regular,
                ),
              );
            }
          },
        ),
      ),
    );
  }

  Widget _buildReviewCard(SiteEntity review, BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Điều hướng tới trang chi tiết địa điểm
        // Navigator.pushNamed(context, '/detail', arguments: review.siteId);
      },
      child: Card(
        color: AppColors.maintheme,
        elevation: 4,
        margin: const EdgeInsets.symmetric(vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hình ảnh địa điểm
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: Image.network(
                review.reviews?[0].medias!.firstWhere(
                  (e) => e.mediaType == 'IMAGE', 
                  orElse: () => MediaEntity(url: category1)
                ).url ?? '', // Đường dẫn ảnh từ API
                width: double.infinity,
                height: 180,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return ImageHandler(imageUrl: category1, defaultImage: category1, height: 180, width: double.infinity, fit: BoxFit.cover,);
                },
              ),
            ),
            const SizedBox(height: 12),
            // Thông tin đánh giá
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Thời gian đăng đánh giá
                  Text(
                    'Đã đánh giá vào ${review.createdAt?.toLocal().toString().split(' ')[0].split('-').reversed.join('/')}',
                    style: AppTextStyles.body2Regular.copyWith(color: Colors.grey),
                  ),
                  const SizedBox(height: 5),
                  // Tên địa điểm
                  Text(
                    review.siteName ?? '',
                    style: AppTextStyles.title1Semibold,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 5),
                  // Địa chỉ
                  Row(
                    children: [
                      const Icon(Icons.location_on, size: 18, color: Colors.grey),
                      const SizedBox(width: 5),
                      Expanded(
                        child: Text(
                          review.resolvedAddress ?? '',
                          style: AppTextStyles.body2Regular.copyWith(color: Colors.grey),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  // Xếp hạng (sao)
                  Row(
                    children: List.generate(5, (index) {
                      return Icon(
                        Icons.star,
                        size: 18,
                        color: index < review.reviews![0].generalRating! ? Colors.amber : Colors.grey.shade300,
                      );
                    }),
                  ),
                  const SizedBox(height: 5),
                  // Nội dung đánh giá
                  Text(
                    review.reviews![0].comment ?? '',
                    style: AppTextStyles.body2Regular,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}