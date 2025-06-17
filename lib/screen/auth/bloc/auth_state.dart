part of 'auth_bloc.dart';

class AuthState {
  ResultState<GetUserResponse> userInfo;
  ResultState<TokenResponse> tokensPair;
  bool enableToast;

  AuthState({
    required this.userInfo,
    required this.enableToast,
    required this.tokensPair
  });

  AuthState.init({
    this.userInfo = const ResultState.idle(),
    this.enableToast = false,
    this.tokensPair = const ResultState.idle()
  });

  AuthState copyWith({
    ResultState<GetUserResponse>? userInfo,
    bool? enableToast,
    ResultState<TokenResponse>? tokensPair
  }){
    return AuthState(
        userInfo : userInfo ?? this.userInfo,
        enableToast: enableToast ?? this.enableToast,
        tokensPair: tokensPair ?? this.tokensPair
    );
  }
}