import 'package:flutter/material.dart';

class HeroImage extends StatefulWidget {
  final String assetsLink;
  final double width;

  const HeroImage({
    super.key, 
    required this.assetsLink, 
    this.width = 320,
  });

  @override
  _HeroImageState createState() => _HeroImageState();
}

class _HeroImageState extends State<HeroImage> {
  double _aspectRatio = 1.0; // Default aspect ratio in case image fails to load.

  @override
  void initState() {
    super.initState();
    _loadImageAspectRatio();
  }

  void _loadImageAspectRatio() {
    // Load the image stream to get the actual dimensions.
    final ImageStream imageStream = AssetImage(widget.assetsLink).resolve(ImageConfiguration.empty);
    final ImageStreamListener listener = ImageStreamListener((ImageInfo info, bool synchronousCall) {
      final int imageWidth = info.image.width;
      final int imageHeight = info.image.height;
      
      // Update the aspect ratio based on the actual image dimensions.
      setState(() {
        _aspectRatio = imageWidth / imageHeight;
      });
    });

    imageStream.addListener(listener);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      clipBehavior: Clip.hardEdge,
      child: Hero(
        tag: 'hero_image',
        child: AspectRatio(
          aspectRatio: _aspectRatio, // Use the calculated aspect ratio.
          child: Image.asset(
            widget.assetsLink,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
