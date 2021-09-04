import 'package:road_side/models/GarageModel.dart';

abstract class IGarageProvider {
  Future<Garage> getGarage(String Id);
}
