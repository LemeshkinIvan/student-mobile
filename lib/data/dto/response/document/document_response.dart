import 'package:freezed_annotation/freezed_annotation.dart';

part 'document_response.g.dart';

@JsonSerializable()
class DocumentResponse{
  final String createdAt;
  final String name;
  final String url;

  const DocumentResponse(this.createdAt, this.name, this.url);

  factory DocumentResponse.fromJson(Map<String, dynamic> json){
    return _$DocumentResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DocumentResponseToJson(this);
}