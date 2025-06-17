import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:student_cabinet_app/common/values/constants.dart';
import 'package:url_launcher/url_launcher.dart';


class SupportLink extends StatelessWidget {
  const SupportLink({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 35.w, top: 5.h),
      child: Row(
        children: [
          const Text("Проблемы со входом? "),
          InkWell(
            onTap: (){
              launchUrl(AppConstants.supportMail);
            },
            child: const Text(
              "Пиши сюда!",
              style: TextStyle(
                  decoration: TextDecoration.underline
              )
            ),
          ),
        ],
      ),
    );
  }
}