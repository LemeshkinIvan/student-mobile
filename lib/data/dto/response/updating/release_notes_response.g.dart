// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'release_notes_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReleaseNotesResponse _$ReleaseNotesResponseFromJson(
        Map<String, dynamic> json) =>
    ReleaseNotesResponse(
      (json['notes'] as List<dynamic>)
          .map((e) => ReleaseNote.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ReleaseNotesResponseToJson(
        ReleaseNotesResponse instance) =>
    <String, dynamic>{
      'notes': instance.notes,
    };

ReleaseNote _$ReleaseNoteFromJson(Map<String, dynamic> json) => ReleaseNote(
      json['whatsNew'] as String,
    );

Map<String, dynamic> _$ReleaseNoteToJson(ReleaseNote instance) =>
    <String, dynamic>{
      'whatsNew': instance.whatsNew,
    };
