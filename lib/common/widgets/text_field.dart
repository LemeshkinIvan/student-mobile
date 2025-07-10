import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String hint;
  final ValueChanged<String> onChanged;
  final ValueChanged<String>? onSubmit;
  final VoidCallback? onTap;
  final List<TextInputFormatter>? filter;
  final int length;
  final TextInputType? type;
  final bool isReadOnly;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hint,
    required this.onChanged,
    required this.filter,
    this.length = 20,
    required this.type,
    this.onTap,
    this.isReadOnly = false,
    this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) => onChanged(value),
      onTap: onTap,
      onSubmitted: (value) => onSubmit != null ? onSubmit!(value) : null,
      readOnly: isReadOnly,
      maxLength: length,
      inputFormatters: filter,
      controller: controller,
      keyboardType: type,
      decoration: InputDecoration(
        labelText: hint,
        counterText: "",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.r)),
      ),
    );
  }
}
