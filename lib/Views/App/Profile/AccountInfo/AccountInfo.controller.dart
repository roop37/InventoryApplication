// // login_screen_controller.dart
//
//
//
// import 'package:flutter/material.dart';
//
// class AccountInfoController {
//   static Future<Map<String, dynamic>> updateAccount(BuildContext context, String name,
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
//
//   static Future<Map<String, dynamic>> getAccountDetails() async {
//     String token = SharedPrefs.getUserToken();
//     Map<String, dynamic> params = {
//       'user_token': token
//     };
//
//     try {
//       final Map<String, dynamic> data = await ApiService.get(GET_ACCOUNT_URL, queryParams: params);
//       print("Account Details: $data");
//
//       Map<String, dynamic> result = {};
//       if (data.containsKey("status") && data['status'] == 'success') {
//         result['name'] = data['name'];
//         result['contact'] = data['contact'];
//         result['contact_alt'] = data['contact_alt'];
//         result['email'] = data['email'];
//         result['gender'] = data['gender'];
//         result['gender'] = data['gender'];
//         result['dob'] = data['dob'];
//       }
//
//       return result;
//     } catch(error) {
//       print('Error fetching account data: $error');
//       throw Exception('Failed to load account data');
//     }
//   }
// }
