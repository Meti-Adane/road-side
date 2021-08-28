import 'package:road_side/domain/auth/credential.dart';
import 'package:road_side/domain/auth/value_objects.dart';

class Mapper{
  static Map<String, dynamic> toJsonFromCredential(Credential credential) => {
    "auth-type":credential.type.toString().split('.').last,
    "name":credential.name,
    "email":credential.emailAddress,
    "password":credential.password,
  };

  static Map<String, dynamic> toJson({required EmailAddress emailAddress, required Password password}) => {
    "email":emailAddress,
    "password":password
};
}