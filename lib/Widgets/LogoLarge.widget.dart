import 'package:flutter/material.dart';

class LogoLarge extends StatelessWidget {
  const LogoLarge({super.key});

  final double sideLength = 100;

  @override
  Widget build(BuildContext context) {
    return SizedBox(

      height: sideLength,
      width: sideLength,
      // child: Image.asset(
      //  "assets/logos/login.png",
      //   fit: BoxFit.contain,
      // ),
      child: Center(
        child: Text(
          "वेद Rich",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}
