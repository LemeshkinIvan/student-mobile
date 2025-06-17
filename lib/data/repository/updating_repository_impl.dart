import 'package:student_cabinet_app/common/utils/api_result.dart';
import 'package:student_cabinet_app/data/api/updating_api.dart';
import 'package:student_cabinet_app/data/dto/request/updating/check_version_request.dart';
import 'package:student_cabinet_app/data/dto/request/updating/release_notes_request.dart';
import 'package:student_cabinet_app/data/dto/response/updating/release_notes_response.dart';
import 'package:student_cabinet_app/data/dto/response/updating/version_response.dart';
import 'package:student_cabinet_app/domain/repository/updating_repository.dart';

class UpdatingRepositoryImpl extends UpdatingRepository {
  final UpdatingApi _api;

  UpdatingRepositoryImpl(this._api);

  @override
  Future<ApiResult<dynamic>> downloading() async {
    return await _api.downloading();
  }

  @override
  Future<ApiResult<VersionResponse>> enableUpdate(CheckVersionRequest dto) async {
    return await _api.enableUpdate(dto);
  }

  @override
  Future<ApiResult<ReleaseNotesResponse>> getReleaseNotes(ReleaseNotesRequest dto) async {
    return await _api.getReleaseNotes(dto);
  }
}