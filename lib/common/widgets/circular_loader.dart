import 'package:flutter/material.dart';
import 'package:student_cabinet_app/common/values/colors.dart';

class CircularLoader extends StatelessWidget {
  const CircularLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(
      color: AppColors.greenDark
    );
  }
}