import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/adapters.dart';

part 'get_user_response.g.dart';

@JsonSerializable()
@HiveType(typeId: 1)
class GetUserResponse {
  @HiveField(0)
  final String uid;

  @HiveField(1)
  @JsonKey(name:"full_name")
  final String fullName;

  @HiveField(2)
  final String group;

  const GetUserResponse(
      this.fullName,
      this.uid,
      this.group,
    );

  factory GetUserResponse.fromJson(Map<String, dynamic> json){
    return _$GetUserResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetUserResponseToJson(this);
}