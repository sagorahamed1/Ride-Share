///app routes





import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:live_location_track_app/presentations/screens/home_screen.dart';


class AppRoutes {
  static const String homeScreen = "/HomeScreen.dart";


  static List<GetPage> get routes => [
    GetPage(name: homeScreen, page: () => HomeScreen()),
  ];
}