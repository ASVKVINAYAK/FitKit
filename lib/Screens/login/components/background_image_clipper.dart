import 'package:flutter/material.dart';
import 'package:gym_app/constants/constants.dart';
import 'package:gym_app/screens/login/components/curve_clipper.dart';



class BackgroundImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return ClipPath(
      clipper: CurveClipper(),
      child: Container(
        height: size.height * 0.55,
        color: blueGrey.withOpacity(0.8),
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: appPadding / 2,
              vertical: appPadding * 3),
          child: Center(
            child:Image.network("https://raw.githubusercontent.com/ASVKVINAYAK/HC-QS/main/d.png"),
          ),
        ),
      ),
    );
  }
}
