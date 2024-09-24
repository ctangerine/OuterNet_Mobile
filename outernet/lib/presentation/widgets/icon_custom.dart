import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconCustom extends StatelessWidget {
  final String svgIcon;
  final double width;
  final double height;

  const IconCustom({
    super.key,
    required this.svgIcon,
    this.width = 24.0,
    this.height = 24.0,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      svgIcon,
      width: width,
      height: height,
    );
  }
}