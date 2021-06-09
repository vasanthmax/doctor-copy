import 'package:doctor/pages/bottomnav.dart';
import 'package:doctor/pages/login.dart';
import 'package:doctor/pages/signup.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        SignupWidget.signupRoute: (_) => SignupWidget(),
        LoginWidget.loginRoute: (_) => LoginWidget(),
        BottomNavWidget.navRoute: (_) => BottomNavWidget()
      },
    );
  }
}
