import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:live_location_track_app/services/constants.dart';
import 'package:location/location.dart';


class HomeController extends GetxController {
  LatLng sourceLocation = const LatLng(23.8103, 90.4125);
  LatLng destination = const LatLng(23.7426, 90.3747);

  RxList<LatLng> polylineCoordinates = <LatLng>[].obs;


  Rx<LocationData?> currentLocation = Rx<LocationData?>(null);

  void getCurrentLocation() {
    Location location = Location();
    location.getLocation().then((locationData) {
      currentLocation.value = locationData;
      update();
    });
  }


  void getPolyPoints() async {
    PolylinePoints polylinePoints = PolylinePoints();

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      googleApiKey: Constants.googleApiKey,
      request: PolylineRequest(
        origin: PointLatLng(sourceLocation.latitude, sourceLocation.longitude),
        destination: PointLatLng(destination.latitude, destination.longitude),
        mode: TravelMode.driving,  // You can change to walking, bicycling, etc.
      ),
    );


    if (result.points.isNotEmpty) {
      polylineCoordinates.clear();
      for (var point in result.points) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      }
      update();
    } else {
      print("No route found.");
    }
  }
}
