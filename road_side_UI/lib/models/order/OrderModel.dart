import 'package:json_annotation/json_annotation.dart';

part 'OrderModel.g.dart';

@JsonSerializable()
class Order{
  String Id;
  String UserId;
  String GarageId;
  String ServiceId;
  String Description;
  String IssuedDate;
  String IsPlaced;
  String Status;
  String CompletedDate;

  Order({
    required this.Id,
    required this.UserId,
    required this.GarageId,
    required this.ServiceId,
    required this.Description,
    required this.IssuedDate,
    required this.IsPlaced,
    required this.Status,
    required this.CompletedDate,
  });

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  Map<String, dynamic> toJson() => _$OrderToJson(this);
}