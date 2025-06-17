// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderRequest _$OrderRequestFromJson(Map<String, dynamic> json) => OrderRequest(
      json['userUid'] as String,
      json['documentType'] as String,
      json['requestDate'] as String,
    );

Map<String, dynamic> _$OrderRequestToJson(OrderRequest instance) =>
    <String, dynamic>{
      'userUid': instance.userUid,
      'documentType': instance.documentType,
      'requestDate': instance.requestDate,
    };
