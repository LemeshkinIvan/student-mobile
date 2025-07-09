import 'dart:typed_data';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_cabinet_app/common/utils/result_state.dart';
import 'package:student_cabinet_app/data/dto/response/schedule/schedule_response.dart';
import 'package:student_cabinet_app/domain/repository/schedule_repository.dart';

part 'schedule_event.dart';
part 'schedule_state.dart';

class ScheduleBloc extends Bloc<ScheduleEvent, ScheduleState>{
  final ScheduleRepository _repository;

  ScheduleBloc(this._repository) : super(ScheduleState.init());
}