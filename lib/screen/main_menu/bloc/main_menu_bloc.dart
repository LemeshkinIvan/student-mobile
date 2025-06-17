import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_cabinet_app/domain/repository/main_menu_repository.dart';

part 'main_menu_event.dart';
part 'main_menu_state.dart';

class MainMenuBloc extends Bloc<MainMenuEvent, MainMenuState> {
  final MainMenuRepository _repository;
  
  MainMenuBloc(this._repository) : super(MainMenuState.init());
}
