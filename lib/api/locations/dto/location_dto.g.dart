// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LocationDto _$LocationDtoFromJson(Map<String, dynamic> json) => _LocationDto(
  value: json['value'] as String,
  id: json['id'] as String,
  countryId: json['countryId'] as String,
);

Map<String, dynamic> _$LocationDtoToJson(_LocationDto instance) =>
    <String, dynamic>{
      'value': instance.value,
      'id': instance.id,
      'countryId': instance.countryId,
    };
