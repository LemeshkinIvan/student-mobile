import 'package:student_cabinet_app/data/api/api_error_handler.dart';
import 'package:student_cabinet_app/data/dto/request/updating/check_version_request.dart';
import 'package:student_cabinet_app/data/dto/request/updating/release_notes_request.dart';
import 'package:student_cabinet_app/common/utils/api_result.dart';
import 'package:student_cabinet_app/common/utils/http_util.dart';
import 'package:student_cabinet_app/data/dto/response/updating/release_notes_response.dart';
import 'package:student_cabinet_app/data/dto/response/updating/version_response.dart';

class UpdatingApi extends ApiErrorHandler {
  final HttpUtil httpUtil;
  final HttpAuthUtil httpAuthUtil;

  UpdatingApi({
    required this.httpUtil,
    required this.httpAuthUtil,
  });

  Future<ApiResult<VersionResponse>> enableUpdate(CheckVersionRequest dto) async {
    try {
      final response = await HttpUtil().post("app/currentVersion/", data: dto.toJson());
      VersionResponse data = VersionResponse.fromJson(response);
      return ApiResult.success(data);
    } catch (e) {
      return returnErrorMsg(e);
    }
  }

  Future<ApiResult<ReleaseNotesResponse>> getReleaseNotes(ReleaseNotesRequest dto) async {
    try {
      final response = await HttpUtil().post(
        "app/currentVersion/releaseNotes/",
        data: dto.toJson()
      );
      ReleaseNotesResponse data = ReleaseNotesResponse.fromJson(response);
      return ApiResult.success(data);
    } catch (e) {
      return returnErrorMsg(e);
    }
  }

  Future<ApiResult<dynamic>> downloading() async {
    try {
      final response = await HttpUtil().get("app/currentVersion/downloading/");
      return ApiResult.success(response);
    } catch (e) {
      return returnErrorMsg(e);
    }
  }
}