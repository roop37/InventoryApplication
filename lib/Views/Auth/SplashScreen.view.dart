import 'dart:async';
import 'package:VedRich/Theme/Spacing.theme.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:VedRich/Views/Auth/LoginScreen/LoginScreen.view.dart';
import 'package:VedRich/Widgets/LogoLarge.widget.dart';
class SplashScreen extends StatefulWidget {
  static const String routeName = "/SplashScreen";
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed(LoginPage.routeName);
      // Navigator.pushReplacementNamed(context, LoginPage.routeName);

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          SizedBox(
          height: Spacings.logoimg,
          width:  Spacings.logoimg,
          child: LogoLarge()
          // Image.asset(
          //   "assets/logos/t.png",
          //   fit: BoxFit.contain,
          // ),
        ),
          ],
        ),
      ),
    );
  }
}