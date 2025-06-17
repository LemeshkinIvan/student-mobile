import 'package:freezed_annotation/freezed_annotation.dart';

part 'schedule_response.g.dart';

// как на неделю, так и на один день
@JsonSerializable()
class ScheduleResponse {
  final String groupName;
  final List<DayOfWeekInnerObject> week;
  final int countWeek;

  ScheduleResponse(this.groupName, this.week, this.countWeek);

  factory ScheduleResponse.fromJson(Map<String, dynamic> json){
    return _$ScheduleResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ScheduleResponseToJson(this);
}

@JsonSerializable()
class DayOfWeekInnerObject {
  final String name;
  final List<SubjectInnerObject> subjects;

  DayOfWeekInnerObject(this.name, this.subjects);

  factory DayOfWeekInnerObject.fromJson(Map<String, dynamic> json){
    return _$DayOfWeekInnerObjectFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DayOfWeekInnerObjectToJson(this);
}

@JsonSerializable()
class SubjectInnerObject {
  final String name;
  final String nameTeacher;
  final String cabinetNumber;
  final String time;
  final String count;

  SubjectInnerObject(
      this.name,
      this.nameTeacher,
      this.cabinetNumber,
      this.time,
      this.count
  );

  factory SubjectInnerObject.fromJson(Map<String, dynamic> json){
    return _$SubjectInnerObjectFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SubjectInnerObjectToJson(this);
}