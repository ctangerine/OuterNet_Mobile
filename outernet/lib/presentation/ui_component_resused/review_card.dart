import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:outernet/domain/entities/review_entity.dart';
import 'package:outernet/env/log_service.dart';
import 'package:outernet/presentation/blocs/site_bloc/site_bloc.dart';
import 'package:outernet/presentation/helper_widgets/image_handler.dart';
import 'package:outernet/presentation/screens/asset_links.dart';
import 'package:outernet/presentation/themes.dart';
import 'package:outernet/presentation/ui_component_resused/fullscreen_image_view.dart';
import 'package:outernet/presentation/ui_component_resused/rating_bar.dart';
import 'package:outernet/presentation/ui_component_resused/video_player.dart';
import 'package:readmore/readmore.dart';

class ReviewCard extends StatelessWidget {
  final ReviewEntity review;
  final bool isFavorite;
  final void Function()? onLikePressed;
  final void Function()? onReportPressed;

  const ReviewCard({
    super.key,
    required this.review,
    required this.isFavorite,
    this.onLikePressed,
    this.onReportPressed,
  });

  String _formatDate(String? date) {
    if (date == null || date.isEmpty) return '';
    try {
      final parsedDate = DateTime.parse(date);
      return DateFormat('d/M/y').format(parsedDate);
    } catch (e) {
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => context.read<SiteBloc>(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildReviewHeader(),
          const SizedBox(height: 10,),
          RatingBar(onRatingChanged: (rating) {}, maxRating: 5, initialRating: (review.generalRating ?? 5).toDouble()),
          const SizedBox(height: 10),
          _buildReviewContent(),
          const SizedBox(height: 10),
          _buildMediaContent(context)
        ],
      ),
    );
  }

  ReadMoreText _buildReviewContent() {
    return ReadMoreText(
      review.comment ?? 'Người dùng này rất lười, chẳng để lại gì cả!',
      trimLines: 3,
      colorClickableText: AppColors.primary,
      trimMode: TrimMode.Line,
      trimCollapsedText: 'xem đầy đủ',
      trimExpandedText: 'rút gọn',
      style: AppTextStyles.body1Regular.copyWith(height: 1.5),
    );
  }

  Row _buildReviewHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 24,
              backgroundImage: review.user?.avatar != null
                  ? NetworkImage(review.user!.avatar!)
                  : const AssetImage(avatarImage),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  review.user?.fullName ?? '',
                  style: AppTextStyles.title1Semibold,
                ),
                Text(
                  _formatDate(review.date?.toString()),
                  style: AppTextStyles.body2Regular,
                ),
              ],
            )
          ],
        ),
        Row(
          children: [
            IconButton(
              padding: const EdgeInsets.all(0),
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? AppColors.primary : Colors.grey,
                size: 26,
              ),
              onPressed: onLikePressed,
            ),
            const SizedBox(width: 5),
            IconButton(
              padding: const EdgeInsets.all(0),
              onPressed: onReportPressed,
              icon: const Icon(Iconsax.flag, color: Colors.black87),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildMediaContent(BuildContext context) {
    final medias = review.medias;
    if (medias == null || medias.isEmpty) return const SizedBox.shrink();

    final images = medias.where((element) => element.mediaType == 'IMAGE').toList();
    final videos = medias.where((element) => element.mediaType == 'VIDEO').toList();

    LogService().logger.i('Images: ${images.length}, Videos: ${videos.length}');

    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: [
        for (final image in images)
          _buildImage(context, image.url ?? ''),
        // for (final video in videos)
        //   _buildVideo(video.url ?? ''),
      ],
    );
  }

  Widget _buildImage(BuildContext context, String imageUrl) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FullscreenImageViewer(imageUrl: imageUrl),
          ),
        );
      },
      child: SizedBox(
        width: 100,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: ImageHandler(imageUrl: imageUrl, defaultImage: category1, width: 200, fit: BoxFit.fitWidth,)
        ),
      ),
    );
  }

  Widget _buildVideo(String videoUrl) {
    return VideoCard(videoUrl: videoUrl);
  }
}