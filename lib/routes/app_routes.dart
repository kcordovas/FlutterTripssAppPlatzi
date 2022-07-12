import 'package:flutter/material.dart';
import 'package:platzi_tripss_app/place/ui/screens/add_place_screen.dart';
import 'package:platzi_tripss_app/place/ui/screens/home_trips.dart';
import 'package:platzi_tripss_app/place/ui/screens/search_trips.dart';
import 'package:platzi_tripss_app/user/ui/screens/profile_trips.dart';
import 'package:platzi_tripss_app/user/ui/screens/sign_in_screen.dart';

const String initialRouteLabelApp = '/';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    initialRouteLabelApp: (context) => SignInScreen(),
    ProfileTrips.routeName: ((context) => ProfileTrips()),
    HomeTrips.routeName: (context) => HomeTrips(),
    SearchTrips.routeName: (context) => SearchTrips(),
    AddPlaceScreen.routeName: (context) => AddPlaceScreen()
  };
}
