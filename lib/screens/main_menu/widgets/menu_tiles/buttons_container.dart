import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:student_cabinet_app/common/dto/menu_block_arguments.dart';
import 'package:student_cabinet_app/common/values/colors.dart';
import 'package:student_cabinet_app/common/values/constants.dart';
import 'package:student_cabinet_app/common/widgets/default_padding.dart';
import 'package:student_cabinet_app/common/widgets/regular_text.dart';

part 'menu_tile.dart';

class ButtonsContainer extends StatelessWidget {
  const ButtonsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultPadding(
        width: 24.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _HeaderSection(text: "Расписание"),
            Row(
              children: [
                MenuBlockElement(
                  AppConstants.menuBlockButtons["schedule"]!,
                  height: 135.h,
                  width: 135.w,
                ),
                MenuBlockElement(
                  AppConstants.menuBlockButtons["schedule_update"]!,
                  height: 135.h,
                  width: 135.w,
                )
              ]
            ),
            const _HeaderSection(text: "Документы"),
            MenuBlockElement(
              AppConstants.menuBlockButtons["doc_list"]!,
              width: 310.w,
              heightPadding: 20.h,
              height: 135.h,
            ),
            MenuBlockElement(
              AppConstants.menuBlockButtons["order"]!,
              width: 310.w,
              heightPadding: 20.h,
              height: 135.h,
            )
          ]
        )
    );
  }
}

class _HeaderSection extends StatelessWidget {
  final String text;

  const _HeaderSection({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 34.w, bottom: 7.w),
      child: RegularText(
        text: text,
        size: 15.sp,
        color: Colors.lightBlue,
        bold: true,
      )
    );
  }
}