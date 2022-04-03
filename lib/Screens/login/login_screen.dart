import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gym_app/screens/login/components/background_image_clipper.dart';
import 'package:gym_app/screens/login/components/circle_button.dart';
import 'package:gym_app/screens/login/components/login_credentials.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BackgroundImage(),
                LoginCredentials(),

              ],
            ),
            CircleButton(),
          ],
        ),
      ),
    );
  }
}
