import 'package:dio/dio.dart';

class Network {
  static final String baseURL = 'https://doctor-backend325.herokuapp.com';
  static final String login = '/auth/login';
  static final String register = '/auth/register';
  static final String verify = '/auth/verify';
  static final String token = '/auth/token';

  Future<bool> signUp(String username, String age, String dob, String city,
      String state, String phone, String email, String password) async {
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
      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } on DioError catch (e) {
      throw Exception(e.response?.statusCode);
    }
  }
}
