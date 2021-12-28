import 'dart:async';
import 'package:flutter/material.dart';
import 'package:spark/constans/constans.dart';
import 'package:spark/pages/responsive.dart';
import 'package:spark/pages/widget_tree.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const WidgetTree()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: purpleDark,
        ),
        if (!ResponsiveLayout.isComputer(context))
          Expanded(
            child: Container(
              color: purpleDark,
              child: const Center(
                  child:
                      Image(width: 170, image: AssetImage('assets/mapp.png'))),
            ),
          ),
      ],
    );
  }
}
