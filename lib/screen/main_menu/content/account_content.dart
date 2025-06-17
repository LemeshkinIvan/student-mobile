import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:student_cabinet_app/common/routes/names.dart';
import 'package:student_cabinet_app/main.dart';

class AccountContent extends StatefulWidget {
  const AccountContent({super.key});

  @override
  State<AccountContent> createState() => _AccountContentState();
}

class _AccountContentState extends State<AccountContent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(
        horizontal: 34.w
      ),
      child: Card(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 24.h
                  ),
                  child: Container(
                    height: 540.h,
                    width: 120.w,
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(20.r),
                      image: const DecorationImage(
                        image: AssetImage("/icons/avatar_moke.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 18.h
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 2.h
                        ),
                        child: Text(
                          "Максимов Олег Игоревич",
                          style: TextStyle(
                              fontSize: 13.sp, fontWeight: FontWeight.bold),
                        )
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 2.h
                        ),
                        child: Text("Группа: 2-09Пс-11",
                          style: TextStyle(
                            fontSize: 8.sp,)
                        )
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 4.h
                          ),
                          child: TextButton.icon(
                            icon: const Icon(Icons.exit_to_app_rounded),
                            onPressed: (){
                              navigatorKey.currentState?.pushNamed(AppRoutes.initial);
                            },
                            label: Text("Выйти", style: TextStyle(fontSize: 8.sp),)
                          )
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      )
    );
  }
}
