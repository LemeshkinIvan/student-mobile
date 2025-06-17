// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScheduleResponse _$ScheduleResponseFromJson(Map<String, dynamic> json) =>
    ScheduleResponse(
      json['groupName'] as String,
      (json['week'] as List<dynamic>)
          .map((e) => DayOfWeekInnerObject.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['countWeek'] as num).toInt(),
    );

Map<String, dynamic> _$ScheduleResponseToJson(ScheduleResponse instance) =>
    <String, dynamic>{
      'groupName': instance.groupName,
      'week': instance.week,
      'countWeek': instance.countWeek,
    };

DayOfWeekInnerObject _$DayOfWeekInnerObjectFromJson(
        Map<String, dynamic> json) =>
    DayOfWeekInnerObject(
      json['name'] as String,
      (json['subjects'] as List<dynamic>)
          .map((e) => SubjectInnerObject.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DayOfWeekInnerObjectToJson(
        DayOfWeekInnerObject instance) =>
    <String, dynamic>{
      'name': instance.name,
      'subjects': instance.subjects,
    };

SubjectInnerObject _$SubjectInnerObjectFromJson(Map<String, dynamic> json) =>
    SubjectInnerObject(
      json['name'] as String,
      json['nameTeacher'] as String,
      json['cabinetNumber'] as String,
      json['time'] as String,
      json['count'] as String,
    );

Map<String, dynamic> _$SubjectInnerObjectToJson(SubjectInnerObject instance) =>
    <String, dynamic>{
      'name': instance.name,
      'nameTeacher': instance.nameTeacher,
      'cabinetNumber': instance.cabinetNumber,
      'time': instance.time,
      'count': instance.count,
    };
