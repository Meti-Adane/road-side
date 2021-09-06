// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ServiceModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Service _$ServiceFromJson(Map<String, dynamic> json) {
  return Service(
    Id: json['Id'] as String,
    Name: json['Name'] as String,
  );
}

Map<String, dynamic> _$ServiceToJson(Service instance) => <String, dynamic>{
      'Id': instance.Id,
      'Name': instance.Name,
    };
