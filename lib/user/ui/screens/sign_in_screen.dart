import 'package:flutter/material.dart';
import 'package:platzi_tripss_app/widgets/button_green.dart';
import 'package:platzi_tripss_app/widgets/gradient_back.dart';

class SignInScreen extends StatefulWidget {
  SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return signInGoogleUi();
  }

  Widget signInGoogleUi() {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          GradientBack("", double.infinity),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Welcome\nThis is your Travel App",
                style: TextStyle(
                    fontSize: 37.0,
                    fontFamily: "Lato",
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              ButtonGreen(
                  text: "Login with Gmail",
                  onPressed: () {},
                  width: double.infinity,
                  height: 50.0)
            ],
          )
        ],
      ),
    );
  }
}
