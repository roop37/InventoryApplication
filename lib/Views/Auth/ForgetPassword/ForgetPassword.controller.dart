// // login_screen_controller.dart
//
// import 'dart:convert';
//
//
// import 'package:Atvarmart/config/api.config.dart';
// import 'package:Atvarmart/services/api.service.dart';
// import 'package:Atvarmart/services/localData.shared.dart';
// import 'package:Atvarmart/views/App/HomeScreen/HomeScreen.view.dart';
// import 'package:Atvarmart/widgets/snackBarService.dart';
// import 'package:flutter/material.dart';
//
// class CreateAccountScreenController {
//   static Future<Map<String, dynamic>> createAccount(BuildContext context, String name,
//       String password, String contact, String email,
//       {String? alt_contact = '',
//       String? addressline_1 = '',
//       String? addressline_2 = '',
//       String? landmark = '',
//       String? city = '',
//       String? state = '',
//       String? pincode = ''}) async {
//     try {
//       final Map<String, dynamic> createAccountParams = {};
//       createAccountParams['name'] = name;
//       createAccountParams['password'] = password;
//       createAccountParams['contact'] = contact;
//       createAccountParams['email'] = email;
//       createAccountParams['alt_contact'] = alt_contact;
//       createAccountParams['addressline_1'] = addressline_1;
//       createAccountParams['addressline_2'] = addressline_2;
//       createAccountParams['landmark'] = landmark;
//       createAccountParams['city'] = city;
//       createAccountParams['state'] = state;
//       createAccountParams['pincode'] = pincode;
//
//       var data = await ApiService.post(CREATEACCOUNT_URL, body: createAccountParams);
//
//       if (data['status'] == 'success') {
//         SharedPrefs.setUserToken(data['user_token']);
//         SnackBarService.success(context, "Successfully created account!");
//         Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
//       } else {
//         SnackBarService.warn(context, data['response']);
//       }
//       return data;
//     } catch (error) {
//       throw Exception('Failed to load data');
//     }
//   }
// }
