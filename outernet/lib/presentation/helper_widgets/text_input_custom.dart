import 'package:flutter/material.dart';
import 'package:outernet/presentation/themes.dart';

class TextInputCustom extends StatelessWidget {
   final String? Function(String?) validator;
   final bool obsecure;
   final TextEditingController controller;
   final String label;
   final String hint;
   final IconData? leadingIcon;

   const TextInputCustom({
      super.key, 
      required this.validator,
      this.obsecure = false,
      required this.controller,
      required this.label,
      required this.hint,
      this.leadingIcon,
   });

   @override 
   Widget build(BuildContext context) {
      return TextFormField( 
        controller: controller,
        obscureText: obsecure,
        validator: validator,
        decoration: InputDecoration(
          prefixIcon: leadingIcon != null ? Icon(leadingIcon, size: 24,) : null,
          labelStyle: const TextStyle(
            color: AppColors.primary,
          ),
          hintStyle: AppTextStyles.title1Regular.copyWith(color: AppColors.textSecondary),
          labelText: label,
          hintText: hint,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(
                color: AppColors.primary,
              ),
          ),
        ),
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
      );
   }
}