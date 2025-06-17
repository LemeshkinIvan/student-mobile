import 'package:student_cabinet_app/data/api/api_error_handler.dart';
import 'package:student_cabinet_app/data/dto/request/auth/login/login_request.dart';
import 'package:student_cabinet_app/data/dto/request/auth/token/token_request.dart';
import 'package:student_cabinet_app/data/dto/response/auth/login/get_user_response.dart';
import 'package:student_cabinet_app/data/dto/response/auth/token/token_response.dart';
import 'package:student_cabinet_app/common/utils/api_result.dart';
import 'package:student_cabinet_app/common/utils/http_util.dart';

class AuthApi extends ApiErrorHandler {
  final HttpUtil httpUtil;
  final HttpAuthUtil httpAuthUtil;

  AuthApi({
    required this.httpUtil,
    required this.httpAuthUtil,
  });

  Future<ApiResult<TokenResponse>> getTokens(TokenRequest dto) async {
    try {
      final response = await HttpUtil().post("auth/token/", data: dto);
      TokenResponse data = TokenResponse.fromJson(response);
      return ApiResult.success(data);
    } catch (e) {
      return returnErrorMsg(e);
    }
  }

  Future<ApiResult<GetUserResponse>> login(LoginRequest dto) async {
    try {
      final response = await HttpUtil().post("auth/login/", data: dto);
      GetUserResponse data = GetUserResponse.fromJson(response);
      return ApiResult.success(data);
    } catch (e) {
      return returnErrorMsg(e);
    }
  }

  Future<ApiResult<TokenResponse>> onRefresh(String token) async {
    try {
      final response = await HttpUtil().post(
        "auth/refresh/", 
        data: {
          "token" : token
        } 
      );
      TokenResponse data = TokenResponse.fromJson(response);
      return ApiResult.success(data);
    } catch (e) {
      return returnErrorMsg(e);
    }
  }
}