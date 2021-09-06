import 'package:json_annotation/json_annotation.dart';

part 'ServiceModel.g.dart';

@JsonSerializable()
class Service{
  String Id;
  String Name;

  Service({
    required this.Id,
    required this.Name,
  });

  factory Service.fromJson(Map<String, dynamic> json) => _$ServiceFromJson(json);
  Map<String, dynamic> toJson() => _$ServiceToJson(this);
}