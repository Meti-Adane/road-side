import 'package:road_side/models/location/LocationModel.dart';

abstract class ILocationProvider{
  Future<Location> getNearbyGarages(String Name);
}