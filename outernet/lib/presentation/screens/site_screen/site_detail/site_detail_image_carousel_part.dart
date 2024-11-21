import 'package:flutter/material.dart';
import 'package:outernet/presentation/ui_component_resused/images_carousel.dart';
import 'package:outernet/env/log_service.dart';
import 'package:outernet/presentation/screens/asset_links.dart';

class ImageCarouselPart extends StatelessWidget {
  final List<String> imageList;

  const ImageCarouselPart({super.key, required this.imageList});

  @override
  Widget build(BuildContext context) {
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
}