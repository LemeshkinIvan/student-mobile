import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:student_cabinet_app/common/widgets/default_padding.dart';
import 'package:student_cabinet_app/common/widgets/regular_text.dart';
import 'package:flutter_svg/svg.dart';

class UserIcon extends StatelessWidget {
  final String userName;
  const UserIcon(this.userName, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultPadding(
          height: 20.h,
          child: SvgPicture.asset(
            height: 55.h,
            "assets/icons/avatar_default.svg",
          ),
        ),
        RegularText(text: userName)
      ],
    );
  }
}