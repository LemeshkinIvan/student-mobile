import 'package:student_cabinet_app/common/utils/api_result.dart';
import 'package:student_cabinet_app/data/dto/request/updating/check_version_request.dart';
import 'package:student_cabinet_app/data/dto/request/updating/release_notes_request.dart';
import 'package:student_cabinet_app/data/dto/response/updating/release_notes_response.dart';
import 'package:student_cabinet_app/data/dto/response/updating/version_response.dart';

abstract class UpdatingRepository {
  Future<ApiResult<VersionResponse>> enableUpdate(CheckVersionRequest dto);

  Future<ApiResult<ReleaseNotesResponse>> getReleaseNotes(ReleaseNotesRequest dto);

  Future<ApiResult<dynamic>> downloading();
}