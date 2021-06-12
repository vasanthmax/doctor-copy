import 'package:doctor/pages/bottomnav.dart';
import 'package:doctor/pages/signup.dart';
import 'package:doctor/service/network.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

import 'signup.dart';

class LoginWidget extends StatefulWidget {
  static const String loginRoute = '/login';

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  bool location = false;
  double _lat = 0;
  double _long = 0;
  String _state = '';
  String _city = '';
  late TextEditingController phone;
  late TextEditingController password;

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.requestPermission();
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    var _locData = await Geolocator.getCurrentPosition();
    if (_locData != null) {
      _lat = _locData.latitude;
      _long = _locData.longitude;
      _getAddressFromLatLng();
    }
    print(_locData);
    return _locData;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _determinePosition();
    phone = TextEditingController();
    password = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
        body: Container(
            constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height,
                maxWidth: MediaQuery.of(context).size.width),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Color(0xffFC2A2A),
                Color(0xffFAAB4F),
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: statusBarHeight, left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image(
                        image: AssetImage('assets/Stethoscope.png'),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.transparent,
                          onSurface: Colors.transparent,
                          shadowColor: Colors.transparent,
                        ),
                        onPressed: () {
                          // Navigator.pushNamed(context, SignupWidget.signupRoute);
                          if (_state.length == 0) {
                            // setState(() {
                            //   location = true;
                            // });
                            print('null value');
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => SignupWidget(
                                          currentCity: _city,
                                          currentState: _state,
                                        )));
                          }
                        },
                        child: Text(
                          'Signup',
                          style: TextStyle(color: Colors.black),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    'Find the best doctors nearest to you',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      shadows: [
                        Shadow(
                          blurRadius: 10.0,
                          color: Colors.black,
                          offset: Offset(5.0, 5.0),
                        ),
                      ],
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Image(
                    height: MediaQuery.of(context).size.height * 0.2,
                    image: AssetImage('assets/doctorloginimg.png')),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 10,
                            ),
                            child: Text(
                              'Welcome back',
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Divider(
                              color: Colors.black,
                              height: 20,
                              thickness: 2,
                              // These params are used to shrink that divider based on screenWidth
                              indent: MediaQuery.of(context).size.width * 0.2,
                              endIndent:
                                  MediaQuery.of(context).size.width * 0.2,
                            ),
                          ),

                          // Align widget for positioning the labels to left most side of screen
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Enter Mobile Number',
                            ),
                          ),
                          TextContainer(
                            child: TextField(
                              controller: phone,
                              keyboardType: TextInputType.number,
                              style: TextStyle(fontSize: 20),
                              decoration: InputDecoration(
                                  prefixIcon: Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 9.5, horizontal: 10),
                                      child: Text(
                                        '+91 |',
                                        style: TextStyle(fontSize: 18),
                                      )),
                                  fillColor: Colors.white,
                                  border: InputBorder.none),
                            ),
                          ),

                          // Align widget for positioning the labels to left most side of screen
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Password',
                            ),
                          ),
                          TextContainer(
                            child: TextField(
                              controller: password,
                              obscureText: true,
                              style: TextStyle(fontSize: 20),
                              decoration: InputDecoration(
                                  suffixIcon: Icon(Icons.visibility),
                                  fillColor: Colors.white,
                                  border: InputBorder.none),
                            ),
                          ),
                          // Use [MediaQuery] for [SizedBox] to make more responsive UI
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                gradient: LinearGradient(colors: [
                                  Color(0xffFC2A2A),
                                  Color(0xffFAAB4F),
                                ])),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.transparent,
                                    shadowColor: Colors.transparent),
                                onPressed: () async {
                                  if (phone.text.isEmpty ||
                                      phone.text.length < 10) {
                                    Fluttertoast.showToast(
                                        msg: 'Enter valid Credentials');
                                  }
                                  if (password.text.isEmpty ||
                                      password.text.length < 6) {
                                    Fluttertoast.showToast(
                                        msg: 'Enter valid Credentials');
                                  }
                                  bool status = await Network().signin(
                                      int.parse(phone.text), password.text);

                                  if (status) {
                                    Navigator.pushNamed(
                                        context, BottomNavWidget.navRoute);
                                  } else {
                                    Fluttertoast.showToast(
                                        msg: 'Enter valid Credentials');
                                  }
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30, vertical: 20),
                                  child: Text(
                                    'Login',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                )),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            )));
  }

  _getAddressFromLatLng() async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(_lat, _long);

      Placemark place = placemarks[0];

      setState(() {
        _state = "${place.administrativeArea}";
        _city = "${place.locality}";
        // _currentAddress =
        //     "${place.subAdministrativeArea}, ${place.administrativeArea}, ${place.country}";
      });
    } catch (e) {
      print(e);
    }
  }
}

/// TextContainer widget contains the decoration of box
/// wrapping the [TextField] in entire application
class TextContainer extends StatelessWidget {
  final Widget child;

  const TextContainer({required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Colors.black)),
        child: child,
      ),
    );
  }
}
