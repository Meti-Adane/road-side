import 'package:uuid/uuid.dart';

class Garage {
  String Name;
  String Id;
  String ImageUrl;
  List ContactNumbers;
  List WorkingHours;
  int Rating;
  List Reviews;
  List AvailableServices;
  List OngoingServices;

  Garage({
    required this.Name,
    required this.Id,
    required this.ImageUrl,
    required this.ContactNumbers,
    required this.WorkingHours,
    required this.Rating,
    required this.Reviews,
    required this.AvailableServices,
    required this.OngoingServices,
  });

  factory Garage.fromJson(Map<String, dynamic> json) {
    return Garage(
      Name: json['name'],
      Id: json['id'],
      ImageUrl: json['imageUrl'],
      ContactNumbers: json['contactNumbers'],
      WorkingHours: json['workingHours'],
      Rating: json['rating'],
      Reviews: json['reviews'],
      AvailableServices: json['availableServices'],
      OngoingServices: json['ongoingServices'],
    );
  }
}
