import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:live_location_track_app/controllers/home_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeController _homeController = Get.put(HomeController());

  @override
  void initState() {
    _homeController.getPolyPoints();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _homeController.currentLocation == null ? const Center(child: Text("locading location")) : GoogleMap(
            initialCameraPosition: CameraPosition(
                target: _homeController.sourceLocation, zoom: 14.5),

          polylines: {
              Polyline(
                polylineId: PolylineId("route"),
                color: Colors.green,
                points: _homeController.polylineCoordinates
              )
          },




          markers: {

            ///===================== Current Location====================>

            // Marker(
            //   markerId: const MarkerId("current Location"),
            //   position: LatLng(
            //       _homeController.currentLocation.latitude!,
            //       _homeController.currentLocation.longitude!
            //   )
            // )


            Marker(
                markerId: const MarkerId("source"),
                position: _homeController.sourceLocation
              ),


            Marker(
                markerId: const MarkerId("destination"),
                position: _homeController.destination
            )
          },

        ));
  }
}
