import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platzi_tripss_app/place/ui/screens/home_trips.dart';
import 'package:platzi_tripss_app/user/ui/screens/profile_trips.dart';
import 'package:platzi_tripss_app/place/ui/screens/search_trips.dart';

class PlatziTripsCupertino extends StatelessWidget {
  const PlatziTripsCupertino({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CupertinoTabScaffold(
          tabBuilder: (context, index) {
            switch (index) {
              case 0:
                return CupertinoTabView(
                  builder: (context) => const HomeTrips(),
                );
              case 1:
                return CupertinoTabView(
                  builder: (context) => const SearchTrips(),
                );
                ;
              case 2:
                return CupertinoTabView(
                  builder: (context) => ProfileTrips.userBlocProvider,
                );
              default:
                throw Exception("Index is not correct");
            }
          },
          tabBar: CupertinoTabBar(items: const [
            BottomNavigationBarItem(
                icon: Icon(
              Icons.home,
              color: Colors.indigo,
            )),
            BottomNavigationBarItem(
                icon: Icon(
              Icons.search,
              color: Colors.indigo,
            )),
            BottomNavigationBarItem(
                icon: Icon(
              Icons.person,
              color: Colors.indigo,
            ))
          ])),
    );
  }
}
