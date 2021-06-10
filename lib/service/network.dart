import 'package:dio/dio.dart';

class Network {
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
    try {
      final Response response = await Dio().post(baseURL + verify, data: {
        "otp": otp,
      });
      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } on DioError catch (e) {
      throw Exception(e.response?.statusCode);
    }
  }

  Future<bool> signin(int phone, String password) async {
    try {
      final Response response = await Dio()
          .post(baseURL + login, data: {"phone": phone, "password": password});
      if (response.statusCode == 200) {
        print(response.data);
        return true;
      } else {
        return false;
      }
    } on DioError catch (e) {
      throw Exception(e.response?.statusCode);
    }
  }
}
