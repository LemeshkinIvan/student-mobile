import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_cabinet_app/common/utils/network_exceptions.dart';
import 'package:student_cabinet_app/data/dto/response/auth/login/get_user_response.dart';
import 'package:student_cabinet_app/data/dto/response/auth/token/token_response.dart';
import 'package:student_cabinet_app/domain/repository/auth_repository.dart';
import 'package:student_cabinet_app/common/utils/result_state.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _repository;

  AuthBloc(this._repository) : super(AuthState.init()){
    on<GetTokensEvent>((event, emit) async {
      try {
        emit(state.copyWith(tokensPair: const ResultState.loading()));
        late ResultState<TokenResponse> result;

        var response = await _repository.getTokensPair(event.code);
        response.when(success: (data) async {
          await _repository.saveTokensAtStorage(data);
          result = ResultState.data(data);
          add(GetUserEvent(data.access));
        }, failure: (e){
          result = ResultState.error(e);
        });

        emit(state.copyWith(tokensPair: result));
      } catch (e){
        emit(state.copyWith(
          tokensPair: const ResultState.error(
            NetworkExceptions.unexpectedError()
          ))
        );
      }
    });

    on<GetUserEvent>((event, emit) async {
      try {
        emit(state.copyWith(userInfo: const ResultState.loading()));
        late ResultState<GetUserResponse> result;

        var response = await _repository.getUser(event.token);
        response.when(success: (data) async {
          await _repository.saveUserAtStorage(data);
          result = ResultState.data(data);
        }, failure: (e){
          result = ResultState.error(e);
        });

        emit(state.copyWith(userInfo: result));
      } catch (e){
        emit(state.copyWith(
          tokensPair: const ResultState.error(NetworkExceptions.unexpectedError()))
        );
      }
    });

    on<AuthEnableToast>((event, emit){
      emit(state.copyWith(enableToast: event.flag));
    });

    on<NullGetUserInfoStateEvent>((event, emit){
      emit(state.copyWith(
        userInfo: const ResultState.idle(),
      ));
    });

    on<NullAuthAllStatesEvent>((event, emit){
      emit(state.copyWith(
        userInfo: const ResultState.idle(),
        tokensPair: const ResultState.idle(),
        enableToast: false
      ));
    });
  }
}