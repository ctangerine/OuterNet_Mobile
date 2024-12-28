import 'package:flutter/material.dart';
import 'package:outernet/domain/entities/site_entity.dart';
import 'package:outernet/presentation/screens/asset_links.dart';
import 'package:outernet/presentation/themes.dart';
import 'package:outernet/presentation/ui_component_resused/images_carousel.dart';

class SiteCard extends StatelessWidget {
  final SiteEntity site;
  final bool showImageOnly;

  const SiteCard({
    super.key,
    required this.site,
    this.showImageOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    final imagesUrl = site.medias?.where((e) => e.mediaType == 'IMAGE').map((e) => e.url).whereType<String>().toList() ?? [];
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: Colors.grey,
          width: 0.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(14),
              topRight: Radius.circular(14),
            ),
            child: ImagesCarousel(
              images: imagesUrl.isEmpty? [category1]: imagesUrl,
              defaultImage: category1,
              width: double.infinity,
              height: 180,
              fit: BoxFit.cover,
              viewportFraction: 1.0,
              isMargin: false,
              isBorder: false,
              isPadding: false,
              isAutoPlay: false,
            ),
          ),
          if (!showImageOnly) 
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 300,
                    child: Text(
                      site.siteName ?? '',
                      style: AppTextStyles.heading1Semibold,
                      softWrap: true,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: 300,
                    child: Text(
                      site.siteType?.name ?? '',
                      style: AppTextStyles.body1Regular.copyWith(height: 1.5),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}