import 'package:json_annotation/json_annotation.dart';

part 'OrderModel.g.dart';

@JsonSerializable()
class Order{
  String Id;
  String UserId;
  String GarageId;
  String Status;
  String CompletedDate;
  String ServiceType;

  Order({
    required this.Id,
    required this.UserId,
    required this.GarageId,
    required this.Status,
    required this.CompletedDate,
    required this.ServiceType,
  });

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  Map<String, dynamic> toJson() => _$OrderToJson(this);
}