import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:outernet/presentation/helper_widgets/image_handler.dart';

class ImagesCarousel extends StatefulWidget {
  final List<String> images;
  final List<String>? imagesDescription;
  final String defaultImage;
  final bool? isEnlarge;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final double? viewportFraction;
  final bool? isMargin;
  final bool? isBorder;
  final bool? isAutoPlay;
  final bool? inSiteCard;
  final bool? isPadding;

  const ImagesCarousel({
    super.key,
    required this.images,
    required this.defaultImage,
    this.imagesDescription,
    this.isEnlarge,
    this.height,
    this.width,
    this.fit,
    this.viewportFraction,
    this.isMargin = true,
    this.isBorder = true,
    this.isAutoPlay = true,
    this.inSiteCard = false,
    this.isPadding = true,
  });

  @override
  ImagesCarouselState createState() => ImagesCarouselState();
}

class ImagesCarouselState extends State<ImagesCarousel> {
  final CarouselSliderController _controller = CarouselSliderController();

  List<Widget> get imageSliders => widget.images.map((item) => _buildImage(item)).toList();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: widget.isPadding == true ? const EdgeInsets.only(top: 15) : null,
          child: CarouselSlider(
            carouselController: _controller,
            options: CarouselOptions(
              aspectRatio: 2,
              viewportFraction: widget.viewportFraction ?? 0.8,
              autoPlay: widget.isAutoPlay ?? true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: widget.isEnlarge ?? false,
              scrollDirection: Axis.horizontal,
              onPageChanged: (index, reason) {
                setState(() {
                });
              },
            ),
            items: imageSliders,
          ),
        ),
      ],
    );
  }

  Widget _buildImage(String imageUrl) {
    int index = widget.images.indexOf(imageUrl);
    String? description = widget.imagesDescription != null && widget.imagesDescription!.length > index
        ? widget.imagesDescription![index]
        : null;

    return Container(
      margin:  widget.isMargin == true ? const EdgeInsets.all(5.0) : null,
      child: ClipRRect(
        borderRadius: widget.isBorder == true ?  const BorderRadius.all(Radius.circular(5.0)) : const BorderRadius.all(Radius.zero),
        child: Stack(
          children: <Widget>[
            ImageHandler(
              imageUrl: imageUrl,
              defaultImage: widget.defaultImage,
              width: widget.width ?? 10000,
              height: widget.height ?? 200,
              fit: widget.fit ?? BoxFit.fitWidth,
            ),
            if (description != null)
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(200, 0, 0, 0),
                        Color.fromARGB(0, 0, 0, 0)
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  child: Text(
                    description,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}