import 'package:flutter/material.dart';
import 'package:outernet/presentation/themes.dart';

class OutlinedButtonCustom extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final Widget? icon;
  final ButtonStyle? style;

  const OutlinedButtonCustom({
    super.key, 
    required this.text,
    required this.onPressed,
    this.style,
    this.icon
  });

  const OutlinedButtonCustom.icon({
    super.key, 
    required this.text,
    required this.onPressed,
    this.style,
    required this.icon,
  });

  

  @override
  Widget build (BuildContext context) {
    if (icon != null) {
      return OutlinedButton.icon(
        onPressed: onPressed,
        icon: icon,
        label: Text(text),
      );
    }

    return OutlinedButton(
      onPressed: onPressed,
      child: Text(text),
    );
  }
}

class FilledButtonCustom extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final ButtonStyle? style;

  const FilledButtonCustom({
    super.key, 
    required this.text,
    required this.onPressed,
    this.style,
  });

  @override
  Widget build (BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      style: style,
      child: Text(text, style: AppTextStyles.title1Semibold,),
    );
  }
}

class TextButtonCustom extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final double paddingLeft;
  final double paddingRight;

  const TextButtonCustom({
    super.key, 
    required this.text,
    required this.onPressed,
    this.paddingLeft = 16.0,
    this.paddingRight = 0.0
  });

  @override
  Widget build (BuildContext context) {
    return TextButton(
      // button style padding right = 0
      style: ButtonStyle(
        padding: WidgetStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.only(left: paddingLeft, right: paddingRight)),

      ),
      onPressed: onPressed,
      child: Text(text, style: AppTextStyles.title1Semibold.copyWith(color: AppColors.primary),),
    );
  }
}