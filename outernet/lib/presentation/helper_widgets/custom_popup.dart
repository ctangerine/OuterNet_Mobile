import 'package:flutter/material.dart';
import 'package:outernet/presentation/screens/asset_links.dart';
import 'package:outernet/presentation/themes.dart';

class CustomPopup extends StatelessWidget {
  final String title;
  final String content;
  final String confirmText;
  final void Function()? onConfirm;
  final void Function()? onReturn;
  final bool? showReturn;
  final bool? showAction;

  const CustomPopup({
    super.key,
    required this.title,
    required this.content,
    required this.confirmText,
    required this.onConfirm,
    this.showReturn = true,
    this.showAction = true,
    this.onReturn,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(24.0),
              topRight: Radius.circular(24.0),
            ),
            child: Image.asset(sunsetImage,fit: BoxFit.fitHeight,),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                if (title.isNotEmpty)
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                const SizedBox(height: 20.0),
                Text(
                  content,
                  style: AppTextStyles.heading2Regular,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    if (showReturn ?? true)
                      TextButton(
                        style: OutlinedButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(24)),
                          ),
                        ),
                        onPressed: onReturn ?? () => Navigator.of(context).pop(),
                        child: Text('Trở về', style: AppTextStyles.title1Regular.copyWith(color: AppColors.textSecondary)),
                      ),
                    if (showAction ?? true)
                      FilledButton(
                        style: ElevatedButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(24.0)),
                          ),
                        ),
                        onPressed: onConfirm,
                        child: Text(confirmText),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}