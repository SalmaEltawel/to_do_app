import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_project/home_screen.dart';
import 'package:to_do_project/my_theme.dart';
import 'package:to_do_project/providers/my_provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String routeName = "splashScreen";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushAndRemoveUntil(
          context, MaterialPageRoute(builder: (context) =>
          HomeScreen(

          ),),
              (route) => false);
    },);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<MyProvider>(context);
    return Scaffold(
        backgroundColor:provider.myTheme==ThemeMode.light? Color(0xffDFECDB):MyThemeData.secondaryColor,
      body: SafeArea(
          child: Center(
              child:
              Image(image: AssetImage("assets/images/splash_todo.png")))),
    );
  }
}
