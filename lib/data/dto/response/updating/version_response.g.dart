// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'version_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VersionResponse _$VersionResponseFromJson(Map<String, dynamic> json) =>
    VersionResponse(
      (json['versionCode'] as num).toInt(),
      json['created_at'] as String,
      json['url'] as String,
      json['versionName'] as String,
    );

Map<String, dynamic> _$VersionResponseToJson(VersionResponse instance) =>
    <String, dynamic>{
      'versionName': instance.versionName,
      'versionCode': instance.versionCode,
      'created_at': instance.createdAt,
      'url': instance.url,
    };
