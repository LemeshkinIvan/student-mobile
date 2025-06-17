import 'package:student_cabinet_app/data/dto/response/auth/login/get_user_response.dart';
import 'package:student_cabinet_app/data/dto/response/auth/token/token_response.dart';
import 'package:student_cabinet_app/common/utils/api_result.dart';

abstract class AuthRepository {
  Future<ApiResult<TokenResponse>> getTokensPair(String code);

  Future<ApiResult<GetUserResponse>> getUser(String token);

  Future<void> saveUserAtStorage(GetUserResponse data);

  Future<void> saveTokensAtStorage(TokenResponse data);
}