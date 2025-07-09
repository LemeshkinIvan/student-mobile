import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_cabinet_app/common/utils/network_exceptions.dart';
import 'package:student_cabinet_app/data/dto/response/auth/login/get_user_response.dart';
import 'package:student_cabinet_app/data/dto/response/auth/token/token_response.dart';
import 'package:student_cabinet_app/domain/repository/auth_repository.dart';
import 'package:student_cabinet_app/common/utils/result_state.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';

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
        emit(state.copyWith(enableSubmitButton: true));
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
        emit(state.copyWith(enableSubmitButton: true));
      } catch (e){
        emit(state.copyWith(
          tokensPair: const ResultState.error(NetworkExceptions.unexpectedError()))
        );
      }
    });

    on<LoginSubmitEvent>((event, emit) async {
      String code = state.inputCode;

      if (code.isNotEmpty){
        String hashCode = _generateInputCodeToMd5(code);
        emit(state.copyWith(enableSubmitButton: false));
        add(GetTokensEvent(hashCode));
      }
    });

    on<SetInputTextEvent>((event, emit){
      state.copyWith(enableSubmitButton: event.text.isNotEmpty);
      state.copyWith(inputCode: event.text);
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

  String _generateInputCodeToMd5(String input) {
    return md5.convert(utf8.encode(input)).toString();
  }
}