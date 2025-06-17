import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultPadding extends StatelessWidget {
  final Widget child;
  final double? width;
  final double? height;

  const DefaultPadding({
    super.key,
    required this.child,
    this.width,
    this.height
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: width ?? 10.w,
          vertical: height ?? 5.h
      ),
      child: child,
    );
  }
}
