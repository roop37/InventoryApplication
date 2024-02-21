
import 'package:VedRich/Views/App/OrderList/OrderList.view.dart';
import 'package:flutter/material.dart';
import 'package:VedRich/Views/App/Dashboard/Dashboard.view.dart';
import 'package:VedRich/Views/App/Profile/AccountInfo/AccountInfo.view.dart';
import 'package:VedRich/Views/App/Profile/ProfileOpt.view.dart';
import 'package:VedRich/Views/Auth/ForgetPassword/ForgetPassword.view.dart';
import 'package:VedRich/Views/Auth/LoginScreen/LoginScreen.view.dart';
import 'package:VedRich/Views/Auth/SplashScreen.view.dart';

Map<String, Widget Function(BuildContext)> routes = {
  // NoInternet.routeName: (ctx) => const NoInternet(),
  // Auth Routes
  LoginPage.routeName: (ctx) => const LoginPage(),
  SplashScreen.routeName:(ctx)=> SplashScreen(),
  DashboardView.routeName:(ctx)=>DashboardView(),
  ProfileView.routeName:(ctx)=>ProfileView(),
  AccountInfo.routeName:(ctx)=>AccountInfo(),
  ForgotPasswordPage.routeName:(ctx)=>ForgotPasswordPage(),
  // AccountInfo.routeName:(ctx)=>AccountInfo(),




};
