import 'package:flutter/material.dart';

class CustomDropdownField extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final List<String> items;
  final String? value;
  final ValueChanged<String?>? onChanged;
  final FormFieldValidator<String>? validator;
  final Color? borderColor;
  final Color? textColor;
  final double borderRadius;

  const CustomDropdownField({
    Key? key,
    this.labelText,
    this.hintText,
    required this.items,
    this.value,
    this.onChanged,
    this.validator,
    this.borderColor,
    this.textColor,
    this.borderRadius = 10.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: value,
      items: items.map((String item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(item),
        );
      }).toList(),
      onChanged: onChanged,
      validator: validator,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: borderColor ?? Theme.of(context).primaryColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: borderColor ?? Theme.of(context).primaryColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: borderColor ?? Theme.of(context).primaryColor,
            width: 2.0,
          ),
        ),
        labelStyle: TextStyle(color: textColor),
        hintStyle: TextStyle(color: textColor),
      ),
    );
  }
}
