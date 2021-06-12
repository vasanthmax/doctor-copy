import 'package:doctor/pages/bottomnav.dart';
import 'package:doctor/pages/login.dart';
import 'package:doctor/pages/otpWidget.dart';
import 'package:doctor/pages/signup.dart';
import 'package:doctor/pages/splash_screen.dart';
import 'package:doctor/providers/signupValue.dart';
import 'package:doctor/service/network.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';

final storage = new FlutterSecureStorage();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserDetails()),
        ChangeNotifierProvider(create: (context) => Network())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          SignupWidget.signupRoute: (_) => SignupWidget(),
          LoginWidget.loginRoute: (_) => LoginWidget(),
          BottomNavWidget.navRoute: (_) => BottomNavWidget(),
          OtpWidget.OTPRoute: (_) => OtpWidget(),
          SplashScreen.splashRoute: (_) => SplashScreen()
        },
      ),
    );
  }
}
