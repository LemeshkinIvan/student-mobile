import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:student_cabinet_app/common/models/fields_generator.dart';
import 'package:student_cabinet_app/common/models/operation_table_model.dart';
import 'package:student_cabinet_app/common/widgets/expansion_card.dart';
import 'package:student_cabinet_app/data/dto/response/schedule/schedule_response.dart';

class Schedule {
  final String groupName;
  final List<DayOfWeek> week;
  final int countWeek;

  Schedule(this.groupName, this.week, this.countWeek);
}

class DayOfWeek {
  final String name;
  final List<Subject> subjects;

  DayOfWeek(this.name, this.subjects);
}

class Subject {
  final String name;
  final String nameTeacher;
  final String cabinetNumber;
  final String time;
  final String count;

  Subject(
      this.name,
      this.nameTeacher,
      this.cabinetNumber,
      this.time,
      this.count
  );
}

List<Subject> day = [
  Subject(
      "Численные методы",
      "Новиков Валерий Александрович",
      "2.3",
      "13:30",
      "1"
  ),
  Subject(
      "Системное программирование",
      "Антонов Вячеслав Андреевич",
      "3.19",
      "15:20",
      "2"
  ),
  Subject(
      "Физическая культура",
      "Королев Виктор Владимирович",
      "Тренажерный зал",
      "16:40",
      "3"
  )
];



class ScheduleCardListSeparated extends StatefulWidget {
  final List<SubjectInnerObject> subjects;
  const ScheduleCardListSeparated({super.key, required this.subjects});

  @override
  State<ScheduleCardListSeparated> createState() => _ScheduleCardListSeparatedState();
}

class _ScheduleCardListSeparatedState extends State<ScheduleCardListSeparated> {
  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return buildListView(widget.subjects);
  }

  Widget buildListView(List<SubjectInnerObject> data) {
    return ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: returnListViewBuilder(data),
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemCount: data.length
    );
  }

  Widget Function(BuildContext p1, int p2) returnListViewBuilder(List<SubjectInnerObject> subj) {
    return (BuildContext context, int index) {
      var fields = FieldsGenerator.genMapDaySchedule(data: subj[index]);
      return buildListViewItemWidget(subj[index], fields);
    };
  }

  Widget buildListViewItemWidget(
      SubjectInnerObject item, Map<ModelOfTableHeaders, String> fields) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 5.h),
        child: OrdersCardPhone(
            header: Map.fromEntries(fields.entries.take(1)),
            body: Map.fromEntries(fields.entries.skip(1)),
            enableTrailing: true,
        )

    );
  }

  @override
  void dispose(){
    super.dispose();
  }
}
