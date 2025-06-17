import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:student_cabinet_app/common/routes/names.dart';
import 'package:student_cabinet_app/common/service/app_manager.dart';
import 'package:student_cabinet_app/common/service/hive_storage.dart';
import 'package:student_cabinet_app/data/dto/response/auth/token/token_response.dart';
import 'package:student_cabinet_app/main.dart';
import '../values/constants.dart';
import 'network_exceptions.dart';

class HttpUtil {
  static final HttpUtil _instance = HttpUtil._internal();
  late Dio _request;

  factory HttpUtil() {
    return _instance;
  }

  HttpUtil._internal(){
    BaseOptions options = BaseOptions(
        baseUrl: AppManager.serverUrlApi,
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 30),
        headers: {},
        contentType: "application/json",
        responseType: ResponseType.json);
    _request = Dio(options);
    if (kDebugMode) {
      _request.interceptors.add(LogInterceptor(
          responseBody: true,
          error: true,
          requestHeader: true,
          responseHeader: false,
          request: true,
          requestBody: true));
    }
  }
  Future<dynamic> get(
      String uri, {
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onReceiveProgress,}) async {
    try {
      var response = await _request.get(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException();
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> post(
      String uri, {
        data,
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onSendProgress,
        ProgressCallback? onReceiveProgress,
      }) async {
    try {
      var response = await _request.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } on FormatException catch (_) {
      throw const FormatException();
    } catch (e) {
      rethrow;
    }
  }
}

class HttpAuthUtil {
  static final HttpAuthUtil _instance = HttpAuthUtil._internal();
  late Dio dio;
  bool _isTokenRefreshing = false;

  factory HttpAuthUtil() {
    return _instance;
  }

  HttpAuthUtil._internal() {
    BaseOptions options = BaseOptions(
        baseUrl: AppManager.serverUrlApi,
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 30),
        headers: {},
        contentType: "application/json",
        responseType: ResponseType.json);
    dio = Dio(options)..httpClientAdapter;
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          if (_isTokenRefreshing) {
            while (_isTokenRefreshing) {
              await Future.delayed(const Duration(milliseconds: 100));
            }
          }
          final String accessToken = HiveStorage.instance.getStringByKey(AppConstants.accessToken) ?? '';
          if (accessToken.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $accessToken';
          }
          return handler.next(options);
        },
        onError: (DioException e, handler) async {
          if (_isTokenRefreshing) {
            while (_isTokenRefreshing) {
              await Future.delayed(const Duration(milliseconds: 100));
            }
            final String accessToken = HiveStorage.instance.getStringByKey(AppConstants.accessToken) ?? '';
            if (accessToken.isNotEmpty) {
              e.requestOptions.headers['Authorization'] ='Bearer $accessToken';
            }
            return handler.resolve(await dio.fetch(e.requestOptions));
          }
          if (e.response?.statusCode == 401 &&
              e.response?.requestOptions.headers['Authorization'] != null) {
            try {
              _isTokenRefreshing = true;
              final String refreshToken = HiveStorage.instance.getStringByKey(AppConstants.accessToken) ?? '';
              final response = await HttpUtil().post("auth/refresh/", data: {"token" : refreshToken} );
              TokenResponse tokens = TokenResponse.fromJson(response);
              await HiveStorage.instance.setValue(AppConstants.accessToken, tokens.access);
              await HiveStorage.instance.setValue(AppConstants.refreshToken, tokens.refresh);

              e.requestOptions.headers['Authorization'] = 'Bearer ${tokens.access}';
              _isTokenRefreshing = false;
              return handler.resolve(await dio.fetch(e.requestOptions));
            } catch (e) {
              if (NetworkExceptions.getErrorType(
                  NetworkExceptions.getDioException(e)) == "unauthorized") {
               
                //toastInfo(msg: "Не получилось обновить сессию");
                navigatorKey.currentState?.pushReplacementNamed(AppRoutes.initial);
              }
            } finally {
              _isTokenRefreshing = false;
            }
          }
          return handler.next(e);
        },
      ),
    );
    if (kDebugMode) {
      dio.interceptors.add(LogInterceptor(
          responseBody: true,
          error: true,
          requestHeader: true,
          responseHeader: false,
          request: true,
          requestBody: true
        )
      );
    }
  }

  Future<dynamic> get(
      String uri, {
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onReceiveProgress,
      }) async {
    try {
      var response = await dio.get(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException();
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> post(
      String uri, {
        data,
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onSendProgress,
        ProgressCallback? onReceiveProgress,
      }) async {
    try {
      var response = await dio.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } on FormatException catch (_) {
      throw const FormatException();
    } catch (e) {
      rethrow;
    }
  }
}
