import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:student_cabinet_app/common/utils/api_result.dart';
import 'package:student_cabinet_app/common/utils/http_util.dart';
import 'package:student_cabinet_app/data/api/api_error_handler.dart';
import 'package:student_cabinet_app/data/dto/request/document/order_request.dart';
import 'package:student_cabinet_app/data/dto/response/document/document_response.dart';
import 'package:student_cabinet_app/data/dto/response/document/order_response.dart';

class DocumentsApi extends ApiErrorHandler {
  final HttpUtil httpUtil;
  final HttpAuthUtil httpAuthUtil;

  DocumentsApi({
    required this.httpUtil,
    required this.httpAuthUtil,
  });

  Future<ApiResult<List<DocumentResponse>>> getDocumentsList(String userUid) async {
    try {
      final response = await HttpUtil().get("documents/$userUid",);
      List<DocumentResponse> data = (response as List<dynamic>)
          .map((e) => DocumentResponse.fromJson(e as Map<String, dynamic>))
          .toList();
      return ApiResult.success(data);
    } catch (e) {
      return returnErrorMsg(e);
    }
  }

  Future<ApiResult<Uint8List>> getCurrentDocument(String documentUid) async {
    try {
      final response = await HttpUtil().get(
        "documents/$documentUid", 
        options: Options(
          responseType: ResponseType.bytes
        )
      );

      return ApiResult.success(response);
    } catch (e) {
      return returnErrorMsg(e);
    }
  }

  Future<ApiResult<OrderResponse>> orderDocument(OrderRequest dto) async {
    try {
      final response = await HttpUtil().post("documents/order", data: dto);
      OrderResponse data = OrderResponse.fromJson(response);
      return ApiResult.success(data);
    } catch (e) {
      return returnErrorMsg(e);
    }
  }
}