// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'release_notes_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReleaseNotesRequest _$ReleaseNotesRequestFromJson(Map<String, dynamic> json) =>
    ReleaseNotesRequest(
      json['version'] as String,
      json['versionCode'] as String,
    );

Map<String, dynamic> _$ReleaseNotesRequestToJson(
        ReleaseNotesRequest instance) =>
    <String, dynamic>{
      'version': instance.version,
      'versionCode': instance.versionCode,
    };
