import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/adapters.dart';

part 'token_response.g.dart';

@JsonSerializable()
@HiveType(typeId: 0)
class TokenResponse {
  @HiveField(0)
  final String access;

  @HiveField(1)
  final String refresh;

  const TokenResponse(this.access, this.refresh);

  factory TokenResponse.fromJson(Map<String, dynamic> json){
    return _$TokenResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TokenResponseToJson(this);
}