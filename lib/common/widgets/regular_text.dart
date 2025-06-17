import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegularText extends StatelessWidget {
  final Color? color;
  final String text;
  final double? size;
  final bool? bold;
  final bool wrap;
  final bool overflow;
  final int? maxLines;
  final TextAlign? alignment;
  final Color? backgroundColor;

  const RegularText(
      {super.key,
      this.color = Colors.black,
      required this.text,
      this.size = 0,
      this.overflow = false,
      this.bold = false,
      this.wrap = false,
      this.maxLines,
      this.backgroundColor,
      this.alignment = TextAlign.start});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      softWrap: wrap,
      maxLines: maxLines ?? (wrap ? null : 1),
      textAlign: alignment,
      overflow: overflow ? TextOverflow.ellipsis : TextOverflow.visible,
      style: TextStyle(
          color: color,
          backgroundColor: backgroundColor,
          fontWeight: bold == true ? FontWeight.bold : FontWeight.w400,
          fontSize: size == 0 ? 5.sp : size),
    );
  }
}
