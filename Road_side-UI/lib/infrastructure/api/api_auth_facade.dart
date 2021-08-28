import 'dart:async';
import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:road_side/domain/auth/auth_failure.dart';

import 'package:road_side/domain/auth/token.dart';
import 'package:road_side/domain/auth/credential.dart';
import 'package:road_side/domain/auth/i_auth_facade.dart';
import 'package:road_side/domain/auth/user.dart';
import 'package:road_side/domain/auth/value_objects.dart';

import 'mapper.dart';

class ApiAuthFacade implements IAuthFacade{
  final http.Client _client;
  String baseUrl;

  ApiAuthFacade(this.baseUrl, this._client);



  @override
  Future<Option<User>> getSignedInUser() {
    // TODO: implement getSignedInUser, Decode credential from response
    throw UnimplementedError();
  }

  @override
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword(Credential credential) async {
    var endpoint = baseUrl + '/auth/register';
    return await _postCredential(endpoint, credential);
  }

  @override
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({required EmailAddress emailAddress, required Password password}) async {
    var endpoint = baseUrl + '/auth/signin';
    return await _postEmailAndPasswordCredential(endpoint, emailAddress: emailAddress, password: password);
  }

  @override
  Future<void> signOut(Token token) async{
    var url = baseUrl + '/auth/signout';
    var headers = {
      "Content-type": "application/json",
      "Authorization": token.value
    };
    var response = await _client.post(Uri.parse(url), headers: headers);
    //TODO - Response from Signout?

  }


  Future<Either<AuthFailure, Unit>> _postCredential(String endpoint, Credential credential) async {
    var response = await _client.post(Uri.parse(endpoint),
        body: jsonEncode(Mapper.toJsonFromCredential(credential)),
        headers: {"Content-type": "application/json"});

    if (response.statusCode != 200) {
      Map map = jsonDecode(response.body);
      return left(AuthFailure.serverError());
      //TODO transformerror??
      //return Result.error(_transformError(map));
    }
    var json = jsonDecode(response.body);

    return json['auth_token'] != null
    //TODO - Define Authentication Failures for API
        ? right(json['auth_token'])
        : left(json['message']);
  }

  Future<Either<AuthFailure, Unit>> _postEmailAndPasswordCredential(String endpoint,
      {required EmailAddress emailAddress, required Password password}) async {
    var response = await _client.post(Uri.parse(endpoint),
        body: jsonEncode(Mapper.toJson(emailAddress: emailAddress, password: password)),
        headers: {"Content-type": "application/json"});

    if (response.statusCode != 200) {
      Map map = jsonDecode(response.body);
      return left(AuthFailure.serverError());
      //TODO
      //return Result.error(_transformError(map));
    }
    var json = jsonDecode(response.body);

    return json['auth_token'] != null
    //TODO - Define Authentication Failures for API
        ? right(json['auth_token'])
        : left(json['message']);
  }

  //TODO Configure this method
  _transformError(Map map) {
    var contents = map['error'] ?? map['errors'];
    if (contents is String) return contents;
    var errStr =
    contents.fold('', (prev, ele) => prev + ele.values.first + '\n');
    return errStr.trim();
  }

}