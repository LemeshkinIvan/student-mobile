// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderResponse _$OrderResponseFromJson(Map<String, dynamic> json) =>
    OrderResponse(
      json['readinessTime'] as String,
      json['dateOfCreation'] as String,
      json['status'] as String,
    );

Map<String, dynamic> _$OrderResponseToJson(OrderResponse instance) =>
    <String, dynamic>{
      'readinessTime': instance.readinessTime,
      'status': instance.status,
      'dateOfCreation': instance.dateOfCreation,
    };
