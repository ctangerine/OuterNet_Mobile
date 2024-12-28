import 'package:flutter/material.dart';
import 'package:outernet/presentation/themes.dart';

class CheckboxCustom extends StatefulWidget {
  final bool value;
  final Function(bool?)? onChanged;
  final String? label;
  final TextStyle? labelStyle;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;

  const CheckboxCustom({
    super.key,
    required this.value,
    this.onChanged,
    this.label,
    this.labelStyle,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  });

  @override
  State<CheckboxCustom> createState() => _CheckboxCustomState();
}

class _CheckboxCustomState extends State<CheckboxCustom> {
  late bool isChecked;

  @override
  void initState() {
    super.initState();
    isChecked = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: widget.mainAxisAlignment,
      crossAxisAlignment: widget.crossAxisAlignment,
      children: [
        Container(
          padding: const EdgeInsets.all(4),
          width: 48,
          height: 48,
          child: Checkbox(
            fillColor: WidgetStateProperty.all(AppColors.primary),
            checkColor: AppColors.maintheme,
            side: const BorderSide(
              color: AppColors.primary,
              width: 2,
            ),
            value: isChecked,
            onChanged: (bool? value) {
              setState(() {
                isChecked = value ?? false;
              });
              if (widget.onChanged != null) {
                widget.onChanged!(value);
              }
            },
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            visualDensity: const VisualDensity(
              horizontal: VisualDensity.minimumDensity,
              vertical: VisualDensity.minimumDensity,
            ),
          ),
        ),
        if (widget.label != null)
          Text(
            widget.label!,
            style: widget.labelStyle,
          ),
      ],
    );
  }
}