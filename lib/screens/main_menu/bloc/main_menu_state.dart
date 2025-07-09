part of 'main_menu_cubit.dart';

class MainMenuState{
  String userName;

  MainMenuState({
    required this.userName
  });

  MainMenuState.init({
    this.userName = "undefined"
  });

  MainMenuState copyWith({
    String? userName
  }){
    return MainMenuState(
        userName : userName ?? this.userName
    );
  }
}