
import 'package:flutter/material.dart';
import 'package:VedRich/Services/localData.shared.dart';
import 'package:VedRich/Theme/Base.theme.dart';
import 'package:VedRich/Views/Auth/SplashScreen.view.dart';
import 'package:VedRich/config/routes.config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SharedPrefs.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Veda Rich',
      debugShowCheckedModeBanner: false,
      routes: routes,
      theme: generateTheme(ThemeModes.light),
      darkTheme: generateTheme(ThemeModes.dark),
      initialRoute: SplashScreen.routeName,
    );
  }
}