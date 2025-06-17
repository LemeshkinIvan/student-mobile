import 'package:freezed_annotation/freezed_annotation.dart';

part 'token_request.g.dart';

@JsonSerializable()
class TokenRequest {
  final String code;

  const TokenRequest(this.code);

  factory TokenRequest.fromJson(Map<String, dynamic> json){
    return _$TokenRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TokenRequestToJson(this);
}