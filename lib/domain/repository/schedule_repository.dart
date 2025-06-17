import 'dart:typed_data';

import 'package:student_cabinet_app/common/utils/api_result.dart';
import 'package:student_cabinet_app/data/dto/request/schedule/schedule_request.dart';
import 'package:student_cabinet_app/data/dto/response/schedule/schedule_response.dart';

abstract class ScheduleRepository {
  Future<ApiResult<ScheduleResponse>> getUpdatesForSchedule(ScheduleRequest dto);

  Future<ApiResult<Uint8List>> getAnnualSchedule();

  Future<ApiResult<ScheduleResponse>> getCurrentScheduleForAWeek(ScheduleRequest dto);

  Future<ApiResult<ScheduleResponse>> getCurrentScheduleForADay(ScheduleRequest dto);
}

