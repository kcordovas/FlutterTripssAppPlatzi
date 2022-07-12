import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_tripss_app/home/platzi_trips.dart';
import 'package:platzi_tripss_app/home/platzi_trips_cupertino.dart';
import 'package:platzi_tripss_app/user/bloc/bloc_user.dart';
import 'package:platzi_tripss_app/user/model/user.dart';
import 'package:platzi_tripss_app/widgets/button_green.dart';
import 'package:platzi_tripss_app/widgets/gradient_back.dart';

class SignInScreen extends StatefulWidget {
  SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late UserBloc _userBloc;

  @override
  Widget build(BuildContext context) {
    // Instance with a provider
    _userBloc = BlocProvider.of(context);
    return _handleCurrentSession();
  }

  Widget _handleCurrentSession() {
    return StreamBuilder(
      stream: _userBloc.authStatus,
      builder: (context, AsyncSnapshot<User?> snapShot) {
        if (!snapShot.hasData || snapShot.hasError) {
          return signInGoogleUi();
        } else {
          return (Platform.isAndroid)
              ? PlatziTrips()
              : const PlatziTripsCupertino();
        }
      },
    );
  }

  Widget signInGoogleUi() {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          GradientBack(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Welcome\nThis is your Travel App",
                style: TextStyle(
                    fontSize: 37.0,
                    fontFamily: "Lato",
                    color: Colors.white,
                    overflow: TextOverflow.visible,
                    fontWeight: FontWeight.bold),
              ),
              ButtonGreen(
                  text: "Login with Gmail",
                  onPressed: () {
                    _userBloc.signIn().then((user) {
                      if (user != null) {
                        _userBloc.updateUser(UserTrips(
                            uid: user.uid,
                            name: user.displayName!,
                            email: user.email!,
                            photoUrl: user.photoURL!));
                      }
                    });
                  },
                  width: double.infinity,
                  height: 50.0)
            ],
          )
        ],
      ),
    );
  }
}
