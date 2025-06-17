import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:student_cabinet_app/data/api/api_error_handler.dart';
import 'package:student_cabinet_app/data/dto/request/schedule/schedule_request.dart';
import 'package:student_cabinet_app/data/dto/response/schedule/schedule_response.dart';
import 'package:student_cabinet_app/common/utils/api_result.dart';
import 'package:student_cabinet_app/common/utils/http_util.dart';

class ScheduleApi extends ApiErrorHandler {
  final HttpUtil httpUtil;
  final HttpAuthUtil httpAuthUtil;

  ScheduleApi({
    required this.httpUtil,
    required this.httpAuthUtil,
  });

  Future<ApiResult<ScheduleResponse>> getCurrentScheduleForADay(ScheduleRequest dto) async {
    try {
      final response = await HttpUtil().post("schedule/current/forADay", data: dto);
      ScheduleResponse data = ScheduleResponse.fromJson(response);
      return ApiResult.success(data);
    } catch (e) {
      return returnErrorMsg(e);
    }
  }

  Future<ApiResult<ScheduleResponse>> getCurrentScheduleForAWeek(ScheduleRequest dto) async {
    try {
      final response = await HttpUtil().post("schedule/current/forAWeek", data: dto);
      ScheduleResponse data = ScheduleResponse.fromJson(response);
      return ApiResult.success(data);
    } catch (e) {
      return returnErrorMsg(e);
    }
  }

  Future<ApiResult<Uint8List>> getAnnualSchedule() async {
    //  за год
    // мб файл
    try {
      final response = await HttpUtil().post(
        "schedule/current/annual", 
        options: Options(responseType: ResponseType.bytes)
      );
      //TokenResponse data = TokenResponse.fromJson(response);
      return ApiResult.success(response);
    } catch (e) {
      return returnErrorMsg(e);
    }
  }

  Future<ApiResult<ScheduleResponse>> getUpdatesForSchedule(ScheduleRequest dto) async {
    try {
      final response = await HttpUtil().post("schedule/updates", data: dto);
      ScheduleResponse data = ScheduleResponse.fromJson(response);
      return ApiResult.success(data);
    } catch (e) {
      return returnErrorMsg(e);
    }
  }
}