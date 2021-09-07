import 'dart:async';
import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:road_side/domain/auth/auth_failure.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:road_side/models/register_credential/RegisterCredential.dart';
import 'package:road_side/domain/auth/i_auth_facade.dart';
import 'package:road_side/models/user/UserModel.dart';
import 'package:road_side/domain/auth/value_objects.dart';
import 'package:road_side/util/const.dart';

import 'mapper.dart';

@LazySingleton(as: IAuthFacade) //TODO - Test injectable
class ApiAuthFacade implements IAuthFacade {
  final http.Client _client;
  SharedPreferences? userSession;
  final String _baseUrl = Constants.baseUrl;



  ApiAuthFacade(this._client) {
    sharedPreference();
  }

  Future<void> sharedPreference() async {
    this.userSession = await SharedPreferences.getInstance();
  }

  @override
  Future<Option<User>> getSignedInUser() async{
    // TODO: implement getSignedInUser, Decode credential from response
    final user = await loadStringFromStorage(
      key: 'user',
      prefs: this.userSession,
    );
    return some(User.fromJson(jsonDecode(user!)));
  }

  @override
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword(
      RegisterCredential credential) async {
    var endpoint = _baseUrl + '/auth/register';
    return await _postCredential(endpoint, credential);
  }

  @override
  Future<Either<AuthFailure, Unit>> signInWithUsernameAndPassword(
      {required Username username, required Password password}) async {
    Uri endpoint = Uri.http(_baseUrl, "/auth/signin");
    return await _postUsernameAndPasswordCredential(endpoint,
        username: username, password: password);
  }

  @override
  Future<void> signOut(String token) async {
    var url = _baseUrl + '/auth/signout';
    var headers = {
      "Content-type": "application/json",
      "Authorization": token
    };
    var response = await _client.post(Uri.parse(url), headers: headers);
    //TODO - Response from Signout?
  }

  Future<Either<AuthFailure, Unit>> _postCredential(
      String endpoint, RegisterCredential credential) async {
    var response = await _client.post(Uri.parse(endpoint),
        body: jsonEncode(credential.toJson()),
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

  Future<Either<AuthFailure, Unit>> _postUsernameAndPasswordCredential(
      Uri endpoint,
      {required Username username,
      required Password password}) async {
    try {
      var response = await _client.post(
        endpoint,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(Mapper.toJson(username: username, password: password)),
      );
      if (response.statusCode == 200) {
        Map responseMap = jsonDecode(response.body);
        await sharedPreference();

        //TODO check api's user response
        await saveStringToStorage(
            key: "User",
            value: jsonEncode(
                Mapper.toJson(username: username, password: password)),
            prefs: this.userSession);
        await saveStringToStorage(
            key: "User Credential",
            value: response.body,
            prefs: this.userSession);

        final user = User(
          Id: responseMap['id'],
          FirstName: responseMap[''],
          LastName: responseMap[''],
          Username: responseMap[''],
          EmailAddress: responseMap[''],
          PhoneNumber: responseMap[''],
          ProfilePicture: responseMap[''],
          Role: responseMap[''],
          OrderHistory: responseMap[''],
          OngoingServices: responseMap[''],
          Favorites: responseMap[''],
        );

        await saveStringToStorage(
            key: 'user',
            value: jsonEncode(user.toJson()),
            prefs: this.userSession);
      }

      return left(AuthFailure.serverError());
    } catch (e) {
      return left(AuthFailure.serverError());
    }


    //TODO - Save token

  }

  //TODO Configure this method
  _transformError(Map map) {
    var contents = map['error'] ?? map['errors'];
    if (contents is String) return contents;
    var errStr =
        contents.fold('', (prev, ele) => prev + ele.values.first + '\n');
    return errStr.trim();
  }

  static Future<String?> loadStringFromStorage(
      {required String key, required SharedPreferences? prefs}) async {
    return await prefs?.getString(key);
  }

  static Future saveStringToStorage(
      {required String key,
      required String value,
      required SharedPreferences? prefs}) async {
    return await prefs?.setString(key, value);
  }
}
