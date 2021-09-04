import 'package:road_side/models/GarageModel.dart';

abstract class IGarageRepository {
  Future<Garage> getGarage(String GarageId);
}
