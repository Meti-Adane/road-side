// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RegisterCredential.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterCredential _$RegisterCredentialFromJson(Map<String, dynamic> json) {
  return RegisterCredential(
    firstName: json['firstName'] as String,
    lastName: json['lastName'] as String,
    phoneNumber: json['phoneNumber'] as String,
    username: json['username'] as String,
    emailAddress: json['emailAddress'] as String,
    password: json['password'] as String,
  );
}

Map<String, dynamic> _$RegisterCredentialToJson(RegisterCredential instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'phoneNumber': instance.phoneNumber,
      'username': instance.username,
      'emailAddress': instance.emailAddress,
      'password': instance.password,
    };
