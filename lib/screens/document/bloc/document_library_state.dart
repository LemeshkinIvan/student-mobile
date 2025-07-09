part of 'document_bloc.dart';


class DocumentState {
  ResultState<List<DocumentResponse>> files;
  ResultState<Uint8List> fileByUid;
  ResultState<OrderResponse> documentOrder;

  DocumentState({
    required this.files,
    required this.documentOrder,
    required this.fileByUid
  });

  DocumentState.init({
    this.fileByUid = const ResultState.idle(),
    this.documentOrder = const ResultState.idle(),
    this.files = const ResultState.idle()
  });

  DocumentState copyWith({
    ResultState<List<DocumentResponse>>? files,
    ResultState<OrderResponse>? documentOrder,
    ResultState<Uint8List>? fileByUid
  }){
    return DocumentState(
        files : files ?? this.files,
        documentOrder: documentOrder ?? this.documentOrder,
        fileByUid: fileByUid ?? this.fileByUid
    );
  }
}