import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Network extends ChangeNotifier {
  static final String baseURL = 'https://doctor-backend325.herokuapp.com';
  static final String login = '/auth/login';
  static final String register = '/auth/register';
  static final String verify = '/auth/verify';
  static final String token = '/auth/token';

  Future<bool> signUp(String username, int age, String dob, String city,
      String state, int phone, String email, String password) async {
    try {
      final Response response = await Dio().post(baseURL + register, data: {
        "username": username,
        "age": age,
        "DOB": age,
        "city": city,
        "state": state,
        "phone": phone,
        "email": email,
        "password": password
      });
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } on DioError catch (e) {
      throw Exception(e.response?.statusCode);
    }
  }

  Future<bool> verifyPhone(int otp) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    try {
      final Response response = await Dio().post(baseURL + verify, data: {
        "otp": otp,
      });
      if (response.statusCode == 201) {
        print(response.data['_id']);
        _prefs.setString("user", response.data['_id']);
        _prefs.setBool("loggedIn", true);
        return true;
      }
    } on DioError catch (e) {
      print(e.response?.statusCode);
    }
    _prefs.setBool("loggedIn", false);
    return false;
  }

  Future<bool> signin(int phone, String password) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();

    try {
      final Response response = await Dio()
          .post(baseURL + login, data: {"phone": phone, "password": password});
      if (response.statusCode == 200) {
        _prefs.setBool("loggedIn", true);
        _prefs.setString("user", response.data['_id']);

        print(response.data);
        return true;
      } else {
        return false;
      }
    } on DioError catch (e) {
      print(e.response?.statusCode);
    }
    _prefs.setBool("loggedIn", false);
    return false;
  }
}
