import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_cabinet_app/domain/repository/main_menu_repository.dart';

part 'main_menu_state.dart';

class MainMenuCubit extends Cubit<MainMenuState> {
  final MainMenuRepository _repository;
  
  MainMenuCubit(this._repository) : super(MainMenuState.init()){
    String userName = _repository.getUserName();
    emit(state.copyWith(userName: userName));
  }
}
