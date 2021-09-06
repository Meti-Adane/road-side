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
    Status: json['Status'] as String,
    CompletedDate: json['CompletedDate'] as String,
    ServiceType: json['ServiceType'] as String,
  );
}

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'Id': instance.Id,
      'UserId': instance.UserId,
      'GarageId': instance.GarageId,
      'Status': instance.Status,
      'CompletedDate': instance.CompletedDate,
      'ServiceType': instance.ServiceType,
    };
