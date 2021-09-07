// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'OrderModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) {
  return Order(
    Id: json['Id'] as String,
    UserId: json['UserId'] as String,
    GarageId: json['GarageId'] as String,
    ServiceId: json['ServiceId'] as String,
    Description: json['Description'] as String,
    IssuedDate: json['IssuedDate'] as String,
    IsPlaced: json['IsPlaced'] as String,
    Status: json['Status'] as String,
    CompletedDate: json['CompletedDate'] as String,
  );
}

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'Id': instance.Id,
      'UserId': instance.UserId,
      'GarageId': instance.GarageId,
      'ServiceId': instance.ServiceId,
      'Description': instance.Description,
      'IssuedDate': instance.IssuedDate,
      'IsPlaced': instance.IsPlaced,
      'Status': instance.Status,
      'CompletedDate': instance.CompletedDate,
    };
