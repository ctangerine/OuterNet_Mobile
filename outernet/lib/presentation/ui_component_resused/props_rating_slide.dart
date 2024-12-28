import 'package:flutter/material.dart';

class RatingSlider extends StatelessWidget {
  final double rating;
  final int maxRating;
  final Color filledColor;
  final Color unfilledColor;
  final double height;
  final double width;

  const RatingSlider({
    super.key,
    required this.rating,
    this.maxRating = 5,
    this.filledColor = const Color.fromARGB(180, 0, 0, 0),
    this.unfilledColor = const Color.fromARGB(255, 220, 219, 219),
    this.height = 10.0,
    this.width = 160.0,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: unfilledColor,
            borderRadius: BorderRadius.circular(14.0),
          ),
        ),
        Container(
          height: height,
          width: (rating / maxRating) * width,
          decoration: BoxDecoration(
            color: filledColor,
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
      ],
    );
  }
}