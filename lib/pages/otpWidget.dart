import 'package:doctor/pages/bottomnav.dart';
import 'package:doctor/service/network.dart';
import 'package:flutter/material.dart';

class OtpWidget extends StatefulWidget {
  static const String OTPRoute = '/verify';
  const OtpWidget({Key? key}) : super(key: key);

  @override
  _OtpWidgetState createState() => _OtpWidgetState();
}

class _OtpWidgetState extends State<OtpWidget> {
  late TextEditingController OTP;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    OTP = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xffF57164),
            Color(0xffF58F65),
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Column(
                children: [
                  Text(
                    'Two-Factor Authentication',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Divider(
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Text(
                    'Enter OTP sent to your mobile',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                    width: MediaQuery.of(context).size.width * 0.5,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black)),
                    child: TextField(
                      controller: OTP,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                      cursorHeight: 25,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
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
                          bool otpVerify =
                              await Network().verifyPhone(int.parse(OTP.text));

                          if (otpVerify) {
                            Navigator.pushNamed(
                                context, BottomNavWidget.navRoute);
                          } else {
                            print('otp not verified');
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 15),
                          child: Text(
                            'Authenticate',
                            style: TextStyle(fontSize: 20),
                          ),
                        )),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Text(
                    "Didn't receive OTP yet ?",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Colors.grey),
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shadowColor: Colors.transparent,
                        primary: Colors.transparent,
                      ),
                      onPressed: () {},
                      child: Text(
                        'RESEND NOW',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Color(0xffF05f5f)),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
