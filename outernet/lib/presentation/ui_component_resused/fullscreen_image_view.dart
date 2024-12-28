import 'package:flutter/material.dart';
import 'package:outernet/presentation/helper_widgets/image_handler.dart';
import 'package:outernet/presentation/screens/asset_links.dart';

class FullscreenImageViewer extends StatelessWidget {
  final String imageUrl;

  const FullscreenImageViewer({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: InteractiveViewer(
          child: ImageHandler(imageUrl: imageUrl, defaultImage: category1),
        ),
      ),
    );
  }
}