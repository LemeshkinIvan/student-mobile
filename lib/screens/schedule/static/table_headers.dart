import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TableHeaders extends StatelessWidget {
  const TableHeaders({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: TextDirection.ltr,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 0.w
          ),
          child: Text(
              "Время начала",
              style: TextStyle(fontSize: 8.sp)
          ),
        ),
        Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 13.w
              ),
              child: Text(
                  "Предмет",
                  style: TextStyle(fontSize: 8.sp)
              ),
            )
        ),
        Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 25.w
              ),
              child: Text(
                  "Кабинет",
                  style: TextStyle(fontSize: 8.sp)
              ),
            )
        )
      ],
    );
  }
}
