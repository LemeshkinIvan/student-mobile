import 'package:freezed_annotation/freezed_annotation.dart';

part 'news_response.g.dart';

@JsonSerializable()
class NewsResponse{
  final String createdAt;
  final String author;
  final String text;

  const NewsResponse(this.createdAt, this.author, this.text);

  factory NewsResponse.fromJson(Map<String, dynamic> json){
    return _$NewsResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$NewsResponseToJson(this);
}