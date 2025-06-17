import 'package:student_cabinet_app/common/utils/api_result.dart';
import 'package:student_cabinet_app/data/api/documents_api.dart';
import 'package:student_cabinet_app/data/dto/request/document/order_request.dart';
import 'package:student_cabinet_app/domain/repository/document_repository.dart';

class DocumentRepositroryImpl extends DocumentRepository {
  final DocumentsApi _api;
  
  DocumentRepositroryImpl(this._api);

  @override
  Future<ApiResult<void>> getCurrentDocument(String documentUid) async {
    return await _api.getCurrentDocument(documentUid);
  }

  @override
  Future<ApiResult<void>> getDocumentsList(String userUid) async {
    return await _api.getDocumentsList(userUid);
  }

  @override
  Future<ApiResult<void>> orderDocument(OrderRequest dto) async {
    return await _api.orderDocument(dto);
  }
}