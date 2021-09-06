import 'package:json_annotation/json_annotation.dart';

part 'RegisterCredential.g.dart';

@JsonSerializable()
class RegisterCredential {
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String username;
  final String emailAddress;
  final String password;

  RegisterCredential({
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.username,
    required this.emailAddress,
    required this.password,
  });

  factory RegisterCredential.fromJson(Map<String, dynamic> json) =>
      _$RegisterCredentialFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterCredentialToJson(this);
}
