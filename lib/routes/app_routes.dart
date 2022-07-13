import 'package:flutter/material.dart';
import 'package:platzi_tripss_app/home/platzi_trips_cupertino.dart';
import 'package:platzi_tripss_app/place/ui/screens/add_place_screen.dart';
import 'package:platzi_tripss_app/place/ui/screens/home_trips.dart';
import 'package:platzi_tripss_app/place/ui/screens/search_trips.dart';
import 'package:platzi_tripss_app/user/ui/screens/profile_trips.dart';
import 'package:platzi_tripss_app/user/ui/screens/sign_in_screen.dart';

const String initialRouteLabelApp = '/';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    initialRouteLabelApp: (context) => SignInScreen(),
    ProfileTrips.routeName: ((context) => ProfileTrips.userBlocProvider),
    HomeTrips.routeName: (context) => HomeTrips.userBlocProvider,
    SearchTrips.routeName: (context) => SearchTrips(),
    AddPlaceScreen.routeName: (context) => AddPlaceScreen(),
    // Tab Views
    PlatziTripsCupertino.routeName: (context) => PlatziTripsCupertino(),
  };
}

Route<dynamic> generateApplicationRouteToCupertino(
    RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case HomeTrips.routeName:
      return MaterialPageRoute(
          builder: (context) => HomeTrips.userBlocProvider);
    case SearchTrips.routeName:
      return MaterialPageRoute(builder: (context) => SearchTrips());
    case ProfileTrips.routeName:
      return MaterialPageRoute(
          builder: (context) => ProfileTrips.userBlocProvider);
    case AddPlaceScreen.routeName:
      return MaterialPageRoute(builder: (context) => AddPlaceScreen());
    default:
      throw Exception("Index is not correct");
  }
}
