import 'dart:typed_data';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_cabinet_app/common/utils/result_state.dart';
import 'package:student_cabinet_app/data/dto/response/document/document_response.dart';
import 'package:student_cabinet_app/data/dto/response/document/order_response.dart';
import 'package:student_cabinet_app/domain/repository/document_repository.dart';

part 'document_event.dart';
part 'document_library_state.dart';

class DocumentBloc extends Bloc<DocumentEvent, DocumentState>{
  final DocumentRepository _repository;

  DocumentBloc(this._repository) : super(DocumentState.init()){

  }
}