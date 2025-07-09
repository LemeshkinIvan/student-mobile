import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:student_cabinet_app/common/widgets/default_padding.dart';
import 'package:student_cabinet_app/common/widgets/regular_text.dart';
import 'package:student_cabinet_app/screens/schedule/static/schedule_card_widget.dart';


List<DayOfWeek> week = [
  DayOfWeek("Четверг", day),
  DayOfWeek("Пятница", day)
];
Schedule schedule = Schedule("4-09ПС-3", week, 1);

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  DateTime? date = DateTime.now();

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: returnTitleWidget(),
        centerTitle: true,
      ),
      body: Column(
        children: [
          buildDayHeader("Четверг"),
          // Expanded(
          //     child: ScheduleCardListSeparated(subjects: schedule.week[0].subjects,
          //     )
          // ),
        ],
      )
    );
  }

  static String convertTimeStampToMoscowDate(String data){
    var utcDate = DateTime.parse(data);
    var formatter = DateFormat('dd MMMM yyyy', 'ru_RU');
    return formatter.format(utcDate);
  }

  Widget returnTitleWidget(){
    // status заказа показывает
    return GestureDetector(
      onTap: () async {
        var w = await showDatePicker(
            initialEntryMode: DatePickerEntryMode.calendarOnly,
            locale: const Locale("ru"),
            context: context,
            firstDate: DateTime(2024),
            lastDate: DateTime(2025, 7, 22)
        );

        setState(() {
          date = w ?? DateTime.now();
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 5.h),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.lightBlueAccent,
          ),
          borderRadius: BorderRadius.circular(33.r),
        ),
        child: RegularText(
          text: "Выбрать день",
          size: 14.sp,
          color: Colors.purpleAccent,
        ),
      )
    );
  }

  Widget buildDayHeader(String day){
    return
        DefaultPadding(
          child: Column(
            children: [
              RegularText(
                text: day,
                size: 25.sp,
                color: Colors.purple,
                bold: true,
              ),
              Text(
                convertTimeStampToMoscowDate(date.toString()),
                style: TextStyle(fontSize: 13.sp),
              )
            ],
          ),
    );
  }



  Widget buildHeaders(){
    return Row(
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


class Subject{
  final String predmet;
  final String time;
  final String room;
  final String predmetTimeNumber;

  const Subject(this.predmet, this.predmetTimeNumber, this.room, this.time);
}

class DaySchedule{
  final List<Subject> schedule;

  const DaySchedule(this.schedule);
}