import 'package:freezed_annotation/freezed_annotation.dart';

part 'schedule_request.g.dart';

@JsonSerializable()
class ScheduleRequest {
  final String groupId;
  final String date;

  const ScheduleRequest(this.groupId, this.date);

  factory ScheduleRequest.fromJson(Map<String, dynamic> json){
    return _$ScheduleRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ScheduleRequestToJson(this);
}