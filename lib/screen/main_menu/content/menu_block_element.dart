import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:student_cabinet_app/common/dto/menu_block_arguments.dart';
import 'package:student_cabinet_app/common/values/colors.dart';
import 'package:student_cabinet_app/common/widgets/default_padding.dart';

class MenuBlockElement extends StatefulWidget {
  final double? height;
  final double? width;
  final double heightPadding;
  final double widthPadding;
  final MenuBlockArguments mainArgs;

  const MenuBlockElement(
    this.mainArgs, {
      super.key,
      this.width,
      this.height,
      this.heightPadding = 0,
      this.widthPadding = 12
    }
  );

  @override
  State<MenuBlockElement> createState() => _MenuBlockElementState();
}

class _MenuBlockElementState extends State<MenuBlockElement> {
  @override
  Widget build(BuildContext context) {
    return DefaultPadding(
      width: widget.widthPadding.h,
      height: widget.heightPadding.h,
      child: GestureDetector(
          onTap: widget.mainArgs.onPressed(),
          child: Row(
            children: [
              Expanded(child: Container(
                  height: 140.h,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(widget.mainArgs.iconPath),
                      fit: BoxFit.cover,
                    ),
                    border: Border.all(
                      width: 0.1.w,
                      color: Colors.red,
                    ),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 5.w),
                        child: Text(
                          widget.mainArgs.text,
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.black
                          ),
                        ),
                      )
                  )
              ))
            ],
          )
      ),
    );
  }
}
