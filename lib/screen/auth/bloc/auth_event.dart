part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class GetUserEvent extends AuthEvent {
  final String token;

  const GetUserEvent(this.token);

  @override
  List<Object?> get props => [token];
}

class GetTokensEvent extends AuthEvent {
  final String code;

  const GetTokensEvent(this.code);

  @override
  List<Object?> get props => [code];
}

class AuthEnableToast extends AuthEvent {
  final bool flag;

  const AuthEnableToast(this.flag);

  @override
  List<Object?> get props => [flag];
}

class NullGetUserInfoStateEvent extends AuthEvent {}

class NullAuthAllStatesEvent extends AuthEvent {}