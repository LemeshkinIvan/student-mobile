import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  final bool border;
  final bool shadow;
  final double? width;
  final double? minWidth;
  final Color? color;
  final double? elevation;
  final double? radius;
  final double? height;
  final Color? borderColor;

  const CustomCard(
      {super.key,
        required this.child,
        this.color = Colors.white,
        this.width,
        this.minWidth,
        this.border = true,
        this.shadow = true,
        this.elevation,
        this.height,
        this.borderColor,
        this.radius});

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints:
        minWidth != null ? BoxConstraints(minWidth: minWidth!) : null,
        width: width,
        height: height,
        decoration: shadow
            ? const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color(0x26000000),
              offset: Offset(0, 1),
              blurRadius: 20,
              spreadRadius: -1,
            ),
          ],
        )
            : null,
        child: Card(
            elevation: elevation,
            margin: EdgeInsets.zero,
            color: color,
            surfaceTintColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius ?? 15.r),
              side: border
                  ? BorderSide(
                color: borderColor ?? Colors.black,
                width: 1,
              )
                  : BorderSide.none,
            ),
            child: child));
  }
}
