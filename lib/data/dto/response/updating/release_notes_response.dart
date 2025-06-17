import 'package:freezed_annotation/freezed_annotation.dart';

part 'release_notes_response.g.dart';

@JsonSerializable()
class ReleaseNotesResponse{
  final List<ReleaseNote> notes;

  const ReleaseNotesResponse(this.notes);

  factory ReleaseNotesResponse.fromJson(Map<String, dynamic> json){
    return _$ReleaseNotesResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ReleaseNotesResponseToJson(this);
}

@JsonSerializable()
class ReleaseNote{
  final String whatsNew;

  const ReleaseNote(this.whatsNew);

  factory ReleaseNote.fromJson(Map<String, dynamic> json){
    return _$ReleaseNoteFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ReleaseNoteToJson(this);
}


