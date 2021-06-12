import 'dart:async';

import 'package:doctor/pages/bottomnav.dart';
import 'package:doctor/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  static const String splashRoute = '/';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void splashScreenTiming() async {
    Timer(Duration(seconds: 3), () async {
      if (!mounted) return;
      SharedPreferences _prefs = await SharedPreferences.getInstance();
      bool? isLoggedIn = _prefs.getBool("loggedIn");
      if (isLoggedIn != null && isLoggedIn) {
        Navigator.of(context).pushNamedAndRemoveUntil(
            BottomNavWidget.navRoute, (route) => false);
      } else {
        Navigator.of(context)
            .pushNamedAndRemoveUntil(LoginWidget.loginRoute, (route) => false);
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashScreenTiming();
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return Scaffold(
        body: Container(
      width: _width,
      height: _height,
      child: Center(
        child: Text(
          "Doctor",
          style: TextStyle(color: Colors.black, fontSize: 38),
        ),
      ),
    ));
  }
}
