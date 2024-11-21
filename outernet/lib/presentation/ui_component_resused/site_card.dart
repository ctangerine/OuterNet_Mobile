import 'package:flutter/material.dart';
import 'package:outernet/data/models/sites/site_by_loc_response_model.dart';
import 'package:outernet/presentation/helper_widgets/image_handler.dart';
import 'package:outernet/presentation/screens/asset_links.dart';
import 'package:outernet/presentation/themes.dart';

class SiteCard extends StatelessWidget {
  final SiteByLocResponseModel site;

  const SiteCard({super.key, required this.site});

  @override
  Widget build(BuildContext context) {
    final imagesUrl = site.medias?.where((e) => e.mediaType == 'IMAGE').map((e) => e.url).whereType<String>().toList() ?? [];
    return Container(
      width: 300,
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
            child: ImageHandler(
              imageUrl: imagesUrl.isNotEmpty ? imagesUrl[0] : category1,
              defaultImage: category1,
              width: 300,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 300,
                  child: Text(
                    site.name ?? '',
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
                    //softWrap: true,
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