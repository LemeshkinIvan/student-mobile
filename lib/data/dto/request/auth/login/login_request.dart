import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_request.g.dart';

@JsonSerializable()
class LoginRequest{
  final String accessToken;

  const LoginRequest(this.accessToken);

  factory LoginRequest.fromJson(Map<String, dynamic> json){
    return _$LoginRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);
}