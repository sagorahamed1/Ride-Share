import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:live_location_track_app/presentations/screens/home_screen.dart';

import 'core/app_routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Live Location Track',
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.homeScreen,
        getPages: AppRoutes.routes,
      home: HomeScreen()
    );
  }
}
