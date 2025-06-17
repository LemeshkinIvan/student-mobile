import 'package:freezed_annotation/freezed_annotation.dart';

part 'check_version_request.g.dart';

@JsonSerializable()
class CheckVersionRequest{
  final String deviceVersion;

  const CheckVersionRequest(this.deviceVersion);

  factory CheckVersionRequest.fromJson(Map<String, dynamic> json){
    return _$CheckVersionRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CheckVersionRequestToJson(this);
}