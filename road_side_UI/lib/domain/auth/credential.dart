import 'package:road_side/domain/auth/value_objects.dart';

class Credential{
  final AuthType type;
  final EmailAddress emailAddress;
  final Password password;
  final String name;

  Credential({
    required this.type,
    required this.emailAddress,
    required this.name,
    required this.password
});
}


enum AuthType {email, google}