import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_cabinet_app/common/utils/result_state.dart';
import 'package:student_cabinet_app/data/dto/response/updating/release_notes_response.dart';
import 'package:student_cabinet_app/data/dto/response/updating/version_response.dart';
import 'package:student_cabinet_app/domain/repository/updating_repository.dart';

part 'app_updating_event.dart';
part 'app_updating_state.dart';

class AppUpdatingBloc extends Bloc<AppUpdatingEvent, AppUpdatingState>{
  final UpdatingRepository _repository;

  AppUpdatingBloc(this._repository) : super(AppUpdatingState.init());
}
