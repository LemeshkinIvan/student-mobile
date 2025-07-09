part of 'auth_bloc.dart';

class AuthState {
  ResultState<GetUserResponse> userInfo;
  ResultState<TokenResponse> tokensPair;
  bool enableToast;
  String inputCode; 
  bool enableSubmitButton;
  String toastMsg;

  AuthState({
    required this.userInfo,
    required this.enableToast,
    required this.tokensPair,
    required this.inputCode,
    required this.enableSubmitButton,
    required this.toastMsg
  });

  AuthState.init({
    this.userInfo = const ResultState.idle(),
    this.enableToast = false,
    this.tokensPair = const ResultState.idle(),
    this.inputCode = "",
    this.enableSubmitButton = true,
    this.toastMsg = ""
  });

  AuthState copyWith({
    ResultState<GetUserResponse>? userInfo,
    bool? enableToast,
    ResultState<TokenResponse>? tokensPair,
    String? inputCode,
    bool? enableSubmitButton,
    String? toastMsg
  }){
    return AuthState(
        userInfo : userInfo ?? this.userInfo,
        enableToast: enableToast ?? this.enableToast,
        tokensPair: tokensPair ?? this.tokensPair,
        inputCode: inputCode ?? this.inputCode,
        enableSubmitButton: enableSubmitButton ?? this.enableSubmitButton,
        toastMsg: toastMsg ?? this.toastMsg
    );
  }
}