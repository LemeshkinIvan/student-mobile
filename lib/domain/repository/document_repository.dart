import 'package:student_cabinet_app/common/utils/api_result.dart';
import 'package:student_cabinet_app/data/dto/request/document/order_request.dart';

abstract class DocumentRepository {
  Future<ApiResult<void>> getDocumentsList(String userUid);

  Future<ApiResult<void>> getCurrentDocument(String documentUid);

  Future<ApiResult<void>> orderDocument(OrderRequest dto);
}