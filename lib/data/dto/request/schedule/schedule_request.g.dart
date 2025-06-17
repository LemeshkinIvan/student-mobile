// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScheduleRequest _$ScheduleRequestFromJson(Map<String, dynamic> json) =>
    ScheduleRequest(
      json['groupId'] as String,
      json['date'] as String,
    );

Map<String, dynamic> _$ScheduleRequestToJson(ScheduleRequest instance) =>
    <String, dynamic>{
      'groupId': instance.groupId,
      'date': instance.date,
    };
