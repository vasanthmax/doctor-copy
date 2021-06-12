import 'package:flutter/foundation.dart';

class UserDetails extends ChangeNotifier {
  late String _username, _dob, _city, _state, _password, _email;
  late int _age, _phone;

  String get username => _username;
  String get dob => _dob;
  String get city => _city;
  String get state => _state;
  String get password => _password;
  String get email => _email;
  int get age => _age;
  int get phone => _phone;

  void setUsername(String username) {
    _username = username;
    notifyListeners();
  }

  void setDob(String dob) {
    _dob = dob;
    notifyListeners();
  }

  void setCity(String city) {
    _city = city;
    notifyListeners();
  }

  void setState(String state) {
    _state = state;
    notifyListeners();
  }

  void setPassword(String password) {
    _password = password;
    notifyListeners();
  }

  void setEmail(String email) {
    _email = email;
    notifyListeners();
  }

  void setAge(int age) {
    _age = age;
    notifyListeners();
  }

  void setPhone(int phone) {
    _phone = phone;
    notifyListeners();
  }
}
