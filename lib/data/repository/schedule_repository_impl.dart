import 'dart:typed_data';

import 'package:student_cabinet_app/common/utils/api_result.dart';
import 'package:student_cabinet_app/data/api/schedule_api.dart';
import 'package:student_cabinet_app/data/dto/request/schedule/schedule_request.dart';
import 'package:student_cabinet_app/data/dto/response/schedule/schedule_response.dart';
import 'package:student_cabinet_app/domain/repository/schedule_repository.dart';

class ScheduleRepositoryImpl extends ScheduleRepository {
  final ScheduleApi _api;

  ScheduleRepositoryImpl(this._api);

  @override
  Future<ApiResult<Uint8List>> getAnnualSchedule() async  {
    return await _api.getAnnualSchedule();
  }

  @override
  Future<ApiResult<ScheduleResponse>> getCurrentScheduleForADay(ScheduleRequest dto) async {
    return await _api.getCurrentScheduleForADay(dto);
  }

  @override
  Future<ApiResult<ScheduleResponse>> getCurrentScheduleForAWeek(ScheduleRequest dto) async {
    return await _api.getCurrentScheduleForAWeek(dto);
  }

  @override
  Future<ApiResult<ScheduleResponse>> getUpdatesForSchedule(dto) async {
    return await _api.getUpdatesForSchedule(dto);
  }
}