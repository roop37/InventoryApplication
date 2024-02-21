import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';


class SharedPrefs {
  static late SharedPreferences  _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }




  static String getUserToken() {
    return _prefs.getString('token') ?? '';
  }

  static Future<void> setUserToken(String token) async {
    await _prefs.setString('token', token);
  }



  static Future<void> removeUserToken() async {
    await _prefs.remove('token');
  }



  static Future<void> setUserData(Map<String, dynamic> userData) async {
    await _prefs.setString('user_data', json.encode(userData));
  }

  static Map<String, dynamic> getUserDetails() {
    String userDataString = _prefs.getString('user_data') ?? '';
    if (userDataString.isNotEmpty) {
      return json.decode(userDataString);
    } else {
      return {};
    }
  }
}
