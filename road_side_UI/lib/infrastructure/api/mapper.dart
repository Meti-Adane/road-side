import 'package:road_side/domain/auth/value_objects.dart';

class Mapper{

  static Map<String, dynamic> toJson({required Username username, required Password password}) => {
    "username":username,
    "password":password
};
}