// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_user_response.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GetUserResponseAdapter extends TypeAdapter<GetUserResponse> {
  @override
  final int typeId = 1;

  @override
  GetUserResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GetUserResponse(
      fields[1] as String,
      fields[0] as String,
      fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, GetUserResponse obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.uid)
      ..writeByte(1)
      ..write(obj.fullName)
      ..writeByte(2)
      ..write(obj.group);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GetUserResponseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetUserResponse _$GetUserResponseFromJson(Map<String, dynamic> json) =>
    GetUserResponse(
      json['full_name'] as String,
      json['uid'] as String,
      json['group'] as String,
    );

Map<String, dynamic> _$GetUserResponseToJson(GetUserResponse instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'full_name': instance.fullName,
      'group': instance.group,
    };
