import 'package:road_side/models/location/LocationModel.dart';

abstract class ILocationProvider{
  Future<List<Location>> getLocations();
}