import 'package:student_cabinet_app/common/service/hive_storage.dart';
import 'package:student_cabinet_app/common/values/constants.dart';
import 'package:student_cabinet_app/data/dto/request/auth/token/token_request.dart';
import 'package:student_cabinet_app/domain/repository/auth_repository.dart';
import 'package:student_cabinet_app/data/api/auth_api.dart';
import 'package:student_cabinet_app/data/dto/request/auth/login/login_request.dart';
import 'package:student_cabinet_app/data/dto/response/auth/login/get_user_response.dart';
import 'package:student_cabinet_app/data/dto/response/auth/token/token_response.dart';
import 'package:student_cabinet_app/common/utils/api_result.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthApi _api;

  AuthRepositoryImpl(this._api);
  
  @override
  Future<ApiResult<GetUserResponse>> getUser(String token) async {
    return await _api.login(LoginRequest(token));
  }

  @override
  Future<ApiResult<TokenResponse>> getTokensPair(String code) async {
    return await _api.getTokens(TokenRequest(code));
  }

  @override
  Future<void> saveTokensAtStorage(TokenResponse tokens) async {
    await HiveStorage.instance.setValue(AppConstants.accessToken, tokens.access);
    await HiveStorage.instance.setValue(AppConstants.refreshToken, tokens.refresh);
  }

  @override
  Future<void> saveUserAtStorage(GetUserResponse data) async {
    await HiveStorage.instance.setValue(AppConstants.userData, data);
  }
}