import 'package:flutter/material.dart';

class TextInputCustom extends StatelessWidget {
   final String? Function(String?) validator;
   final bool obsecure;
   final TextEditingController controller;
   final String label;
   final String hint;

   const TextInputCustom({
      super.key, 
      required this.validator,
      this.obsecure = false,
      required this.controller,
      required this.label,
      required this.hint,
   });

   @override 
   Widget build(BuildContext context) {
      return TextFormField(
         controller: controller,
         obscureText: obsecure,
         validator: validator,
         decoration: InputDecoration(
            labelText: label,
            hintText: hint,
            border: OutlineInputBorder(
               borderRadius: BorderRadius.circular(4),
            ),
         ),
         keyboardType: TextInputType.emailAddress,
         textInputAction: TextInputAction.next,
      );
   }
}