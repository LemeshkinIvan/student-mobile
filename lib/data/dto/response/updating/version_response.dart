import 'package:freezed_annotation/freezed_annotation.dart';

part 'version_response.g.dart';

@JsonSerializable()
class VersionResponse{
  final String versionName;
  final int versionCode;
  @JsonKey(name: "created_at")
  final String createdAt;
  final String url;

  const VersionResponse(this.versionCode, this.createdAt, this.url, this.versionName);

  factory VersionResponse.fromJson(Map<String, dynamic> json){
    return _$VersionResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$VersionResponseToJson(this);
}