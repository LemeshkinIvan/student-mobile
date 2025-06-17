import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_response.g.dart';

@JsonSerializable()
class OrderResponse{
  final String readinessTime;
  final String status;
  final String dateOfCreation;

  const OrderResponse(this.readinessTime, this.dateOfCreation, this.status);

  factory OrderResponse.fromJson(Map<String, dynamic> json){
    return _$OrderResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$OrderResponseToJson(this);
}