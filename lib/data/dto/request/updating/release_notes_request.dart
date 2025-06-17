import 'package:freezed_annotation/freezed_annotation.dart';

part 'release_notes_request.g.dart';

@JsonSerializable()
class ReleaseNotesRequest{
  final String version;
  final String versionCode;

  const ReleaseNotesRequest(this.version, this.versionCode);

  factory ReleaseNotesRequest.fromJson(Map<String, dynamic> json){
    return _$ReleaseNotesRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ReleaseNotesRequestToJson(this);
}