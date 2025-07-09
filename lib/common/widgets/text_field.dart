import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String hint;
  final Function(String? value) onChanged;
  final Function onTap;
  final List<TextInputFormatter>? filter;
  final int? length;
  final TextInputType? type;
  final bool isReadOnly;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hint,
    required this.onChanged,
    required this.filter,
    required this.length,
    required this.type,
    required this.onTap,
    required this.isReadOnly
  });

  @override
  Widget build(BuildContext context){
    return TextField(
      onChanged: (value) => onChanged(value) ,
      onTap: onTap(),
      readOnly: isReadOnly,
      maxLength: length ?? 20,
      inputFormatters: filter,
      controller: controller,
      keyboardType: type,
      decoration: InputDecoration(
          labelText: hint,
          counterText: "",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
          )
      ),
    );
  }
}