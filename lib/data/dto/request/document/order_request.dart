import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_request.g.dart';

@JsonSerializable()
class OrderRequest{
  final String userUid;
  final String documentType;
  final String requestDate;

  const OrderRequest(this.userUid, this.documentType, this.requestDate);

  factory OrderRequest.fromJson(Map<String, dynamic> json){
    return _$OrderRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$OrderRequestToJson(this);
}