//
// import 'dart:convert';
// import 'package:Atvarmart/config/api.config.dart';
// import 'package:Atvarmart/services/api.service.dart';
// import 'package:Atvarmart/services/localData.shared.dart';
// import 'package:Atvarmart/views/App/HomeScreen/HomeScreen.view.dart';
// import 'package:Atvarmart/widgets/snackBarService.dart';
// import 'package:flutter/material.dart';
//
// class LoginScreenController {
//   static Future<Map<String, dynamic>> login(BuildContext context, String username, String password) async {
//     try {
//       final Map<String, dynamic> loginParams = {};
//       loginParams['username'] = username;
//       loginParams['password'] = password;
//
//       var data = await ApiService.post(LOGIN_URL, body: loginParams);
//
//       if (data['status'] == 'success') {
//
//         SharedPrefs.setUserToken(data['user_token']);
//         SnackBarService.success(context, "Successfully logged in!");
//         Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
//       }else{
//         SnackBarService.warn(context, data['response']);
//       }
//       return data;
//     } catch (error) {
//
//       throw Exception('Failed to load data');
//     }
//   }
// }