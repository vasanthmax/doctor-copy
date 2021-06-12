import 'package:doctor/main.dart';
import 'package:doctor/pages/otpWidget.dart';
import 'package:doctor/providers/signupValue.dart';
import 'package:doctor/service/network.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'login.dart';

class SignupWidget extends StatefulWidget {
  static const String signupRoute = '/signup';
  final String currentCity;
  final String currentState;

  const SignupWidget({Key? key, this.currentCity = '', this.currentState = ''})
      : super(key: key);

  @override
  _SignupWidgetState createState() => _SignupWidgetState();
}

class _SignupWidgetState extends State<SignupWidget> {
  late TextEditingController username;
  late TextEditingController age;
  late TextEditingController dob;
  late TextEditingController state;
  late TextEditingController city;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController password;

  DateTime currentDate = DateTime.now();
  DateTime nowDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime pickedDate = (await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(1900),
        lastDate: DateTime(2050)))!;
    if (pickedDate != null && pickedDate != currentDate)
      setState(() {
        currentDate = pickedDate.toLocal();
      });
    int ageval = nowDate.year - currentDate.year;
    age..text = ageval.toString();
    dob..text = "${currentDate.year}-${currentDate.month}-${currentDate.day}";
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    username = TextEditingController();
    age = TextEditingController();
    dob = TextEditingController();
    state = TextEditingController(text: widget.currentState);
    city = TextEditingController(text: widget.currentCity);
    email = TextEditingController();
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
                padding:
                    EdgeInsets.only(top: statusBarHeight, left: 20, right: 20),
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
                        Navigator.pushNamed(context, LoginWidget.loginRoute);
                      },
                      child: Text(
                        'Login',
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
                            'Create your account',
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
                            endIndent: MediaQuery.of(context).size.width * 0.2,
                          ),
                        ),

                        // Align widget for positioning the labels to left most side of screen
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Username',
                          ),
                        ),
                        TextContainer(
                          child: TextField(
                            controller: username,
                            style: TextStyle(fontSize: 20),
                            decoration: InputDecoration(
                                fillColor: Colors.white,
                                border: InputBorder.none),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'DOB',
                          ),
                        ),
                        TextContainer(
                          child: TextField(
                            controller: dob,
                            style: TextStyle(fontSize: 20),
                            decoration: InputDecoration(
                                suffixIcon: IconButton(
                                    icon: Icon(Icons.calendar_today),
                                    onPressed: () {
                                      _selectDate(context);
                                    }),
                                fillColor: Colors.white,
                                border: InputBorder.none),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Age',
                          ),
                        ),
                        TextContainer(
                          child: TextField(
                            controller: age,
                            keyboardType: TextInputType.number,
                            style: TextStyle(fontSize: 20),
                            decoration: InputDecoration(
                                fillColor: Colors.white,
                                border: InputBorder.none),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'City',
                          ),
                        ),
                        TextContainer(
                          child: TextField(
                            readOnly: true,
                            controller: city,
                            style: TextStyle(fontSize: 20),
                            decoration: InputDecoration(
                                fillColor: Colors.white,
                                border: InputBorder.none),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'State',
                          ),
                        ),
                        TextContainer(
                          child: TextField(
                            readOnly: true,
                            controller: state,
                            style: TextStyle(fontSize: 20),
                            decoration: InputDecoration(
                                fillColor: Colors.white,
                                border: InputBorder.none),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'email',
                          ),
                        ),
                        TextContainer(
                          child: TextField(
                            controller: email,
                            style: TextStyle(fontSize: 20),
                            decoration: InputDecoration(
                                fillColor: Colors.white,
                                border: InputBorder.none),
                          ),
                        ),
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
                            'Create Password',
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
                          child: Consumer<UserDetails>(
                            builder: (context, value, _) {
                              return ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.transparent,
                                      shadowColor: Colors.transparent),
                                  onPressed: () async {
                                    if (username.text.isEmpty ||
                                        username.text.length < 3) {
                                      Fluttertoast.showToast(
                                          msg: "Enter a valid username");
                                    }
                                    if (dob.text.isEmpty) {
                                      Fluttertoast.showToast(
                                          msg: "Enter a valid date");
                                    }
                                    if (age.text.isEmpty) {
                                      Fluttertoast.showToast(
                                          msg: "Enter a valid age");
                                    }
                                    if (state.text.isEmpty) {
                                      Fluttertoast.showToast(
                                          msg:
                                              "Enter a valid State or try turn on location");
                                    }
                                    if (city.text.isEmpty) {
                                      Fluttertoast.showToast(
                                          msg:
                                              "Enter a valid city or try turn on location");
                                    }
                                    bool emailValid = RegExp(
                                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                        .hasMatch(email.text);
                                    if (email.text.isEmpty ||
                                        emailValid == false) {
                                      Fluttertoast.showToast(
                                          msg: "Enter a valid email");
                                    }
                                    if (phone.text.isEmpty ||
                                        phone.text.length < 10) {
                                      Fluttertoast.showToast(
                                          msg: "Enter a valid phone");
                                    }
                                    if (password.text.isEmpty ||
                                        password.text.length < 6) {
                                      Fluttertoast.showToast(
                                          msg: "Enter a valid password");
                                    }
                                    value.setAge(int.parse(age.text));
                                    value.setUsername(username.text);
                                    value.setCity(city.text);
                                    value.setState(state.text);
                                    value.setEmail(email.text);
                                    value.setPassword(password.text);
                                    value.setPhone(int.parse(phone.text));
                                    value.setDob(dob.text);

                                    bool success = await Network().signUp(
                                        value.username,
                                        value.age,
                                        value.dob,
                                        value.city,
                                        value.state,
                                        value.phone,
                                        value.email,
                                        value.password);

                                    if (success) {
                                      Navigator.pushNamed(
                                          context, OtpWidget.OTPRoute);
                                    } else {
                                      print('otp not received');
                                    }
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 30, vertical: 20),
                                    child: Text(
                                      'Create',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ));
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
