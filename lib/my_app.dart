import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

import 'package:platzi_tripss_app/home/platzi_trips.dart';
import 'package:platzi_tripss_app/home/platzi_trips_cupertino.dart';
import 'dart:io' show Platform;

import 'package:platzi_tripss_app/user/bloc/bloc_user.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: UserBloc(),
      child: myMaterialApp(),
    );
  }

  Widget myMaterialApp() => MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        //home: const MyHomePage(title: 'Flutter Demo Home Page'),
        home:
            (Platform.isAndroid) ? PlatziTrips() : const PlatziTripsCupertino(),
      );
}
