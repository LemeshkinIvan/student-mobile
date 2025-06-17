import 'package:dio/dio.dart';
import 'package:student_cabinet_app/common/utils/api_result.dart';
import 'package:student_cabinet_app/common/utils/network_exceptions.dart';

class ApiErrorHandler {
  ApiResult<T> returnErrorMsg<T>(Object e) {
    if (e is DioException && e.response != null) {
      final responseData = e.response?.data;
      if (responseData != null) {
        if (responseData is String) {
          return ApiResult.failure(
              NetworkExceptions.defaultError(responseData));
        } else if (responseData is Map<String, dynamic> &&
            responseData.containsKey('message')) {
          var errorMessage = responseData['message'];
          return ApiResult.failure(
              NetworkExceptions.defaultError(errorMessage));
        }
        return const ApiResult.failure(
            NetworkExceptions.defaultError("Ошибка при создании запроса"));
      }
    }
    return ApiResult.failure(NetworkExceptions.getDioException(e));
  }
}
