import 'package:flutter/material.dart';
import 'package:spark/splashScreen/splash_screen.dart';
import 'constans/constans.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: purpleDark,
          primarySwatch: Colors.blue,
          canvasColor: purplelight,
        ),
        debugShowCheckedModeBanner: false,
        home: const SplashScreen());
  }
}
