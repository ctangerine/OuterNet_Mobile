import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:outernet/data/models/sites/common_site_model.dart';
import 'package:outernet/domain/entities/review_entity.dart';
import 'package:outernet/domain/entities/site_entity.dart';
import 'package:outernet/env/config.dart';
import 'package:outernet/presentation/screens/asset_links.dart';
import 'package:outernet/presentation/themes.dart';
import 'package:outernet/presentation/ui_component_resused/rating_bar.dart';
import 'package:outernet/presentation/ui_component_resused/props_rating_slide.dart';
import 'package:readmore/readmore.dart';

class IntroducePart extends StatelessWidget {
  final SiteEntity siteDetail;
  final List<ReviewEntity> siteReview;

  const IntroducePart({super.key, required this.siteDetail, required this.siteReview});

  @override
  Widget build(BuildContext context) {
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

  Row _buildRatingBar(SiteEntity siteDetail, List<ReviewEntity> siteReview) {
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
        Container(
          height: 20,
          width: 1,
          color: const Color.fromARGB(255, 37, 37, 37),
        ),
        const SizedBox(width: 10,),
        Text('${siteReview.length} đánh giá', style: AppTextStyles.body1Regular.copyWith(fontSize: 16),),
      ],
    );
  }

  Widget _buildLocation(SiteEntity siteDetail) {
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

  Widget _buildDescription(SiteEntity siteDetail, List<ReviewEntity> siteReview) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: _descriptionBox(siteDetail, siteReview),
    );
  }

  Widget _descriptionBox(SiteEntity siteDetail, List<ReviewEntity> siteReview) {
    final ratings = [
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

  Row _descriptionRatingPart(SiteEntity siteDetail, List<ReviewEntity> siteReview, List<int> ratings) {
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
              Text('${siteReview.length} đánh giá', style: AppTextStyles.body1Regular,),
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

  Widget _buildMap(SiteEntity siteDetail) {
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

  Widget _buildWebsite(SiteEntity siteDetail) {
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

  Widget _buildContact(SiteEntity siteDetail) {
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
}