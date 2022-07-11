import 'package:flutter/material.dart';
import 'package:platzi_tripss_app/place/ui/screens/home_trips.dart';
import 'package:platzi_tripss_app/user/ui/screens/profile_trips.dart';
import 'package:platzi_tripss_app/place/ui/screens/search_trips.dart';

class PlatziTrips extends StatefulWidget {
  PlatziTrips({Key? key}) : super(key: key);

  @override
  State<PlatziTrips> createState() => _PlatziTripsState();
}

class _PlatziTripsState extends State<PlatziTrips> {
  final widgetsTab = <Widget>[
    const HomeTrips(),
    const SearchTrips(),
    ProfileTrips.userBlocProvider
  ];
  var tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgetsTab[tabIndex],
      bottomNavigationBar: Theme(
          data: Theme.of(context)
              .copyWith(canvasColor: Colors.white, primaryColor: Colors.purple),
          child: BottomNavigationBar(
            currentIndex: tabIndex,
            onTap: onTapOnBottomNavigationBar,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
              BottomNavigationBarItem(icon: Icon(Icons.search), label: ""),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: "")
            ],
          )),
    );
  }

  onTapOnBottomNavigationBar(int index) {
    setState(() {
      tabIndex = index;
    });
  }
}
