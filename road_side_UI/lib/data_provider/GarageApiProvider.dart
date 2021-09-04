import 'dart:convert';
import 'package:road_side/data_provider/IGarageProvider.dart';
import 'package:road_side/models/GarageModel.dart';
import 'package:http/http.dart' as http;

class GarageApiProvider implements IGarageProvider {
  String baseUrl = "api/garages";
  final successCode = 200;

  //TODO - Untrusted Code
  Future<Garage> getGarage(String GarageId) async {
    final response = await http.get(Uri.parse(baseUrl));
    return parseResponse(response);
  }

  Garage parseResponse(http.Response response) {
    final responseString = jsonDecode(response.body);

    if (response.statusCode == successCode) {
      return Garage.fromJson(responseString);
    } else {
      throw Exception('Failed to load garages');
    }
  }
}
