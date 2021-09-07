// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:road_side/data_provider/location_provider/ILocationProvider.dart';
// import 'package:road_side/models/location/LocationModel.dart';
// import 'package:road_side/util/const.dart';
//
// class LocationApiProvider implements ILocationProvider{
//   String _baseUrl = Constants.baseUrl;
//   final http.Client _client;
//
//   LocationApiProvider(this._client);
//
//   @override
//   Future<List<Location>> getLocations() async {
//     final response = await http.get(Uri.parse(_baseUrl));
//     return await parseResponse(response);
//   }
//
//   Future<List<Location>> parseResponse(http.Response response) async {
//     final responseString = jsonDecode(response.body);
//
//     if (response.statusCode == 200) {
//       return Location.fromJson(responseString);
//     } else {
//       throw Exception('Failed to load garages');
//     }
//   }
// }
//
// }