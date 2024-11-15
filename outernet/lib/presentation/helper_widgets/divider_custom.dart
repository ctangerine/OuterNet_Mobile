import 'package:flutter/material.dart';

class DividerCustom extends StatelessWidget {
  final String text;
  final double lineWidth;

  const DividerCustom({
    super.key,
    required this.text,
    this.lineWidth = 1.0,
  });

  @override
  Widget build (BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(right: 8.0),
            child: Divider(
              thickness: lineWidth,
            ),
          ),
        ),
        Text(text, style: const TextStyle(fontWeight: FontWeight.w600),),
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(left: 8.0),
            child: Divider(
              thickness: lineWidth,
            ),
          ),
        ),
      ],
    );
  }
}