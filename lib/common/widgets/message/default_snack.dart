import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void showSnackBar(BuildContext context, String msg){
  ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(msg, style: TextStyle(fontSize: 14.sp),))
    );
}