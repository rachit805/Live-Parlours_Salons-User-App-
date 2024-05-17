import 'package:booking/hairSalon/screens/BHNotifyScreen.dart';
import 'package:booking/hairSalon/screens/WelcomeScreens.dart';

import 'lib.dart';

import 'dart:async';
import 'package:nb_utils/nb_utils.dart';
import 'package:flutter/material.dart';

import'package:booking/hairSalon/screens/BHWalkThroughScreen.dart';

class BHSplashScreen extends StatefulWidget {
  static String tag = '/BHSplashScreen';

  @override
  BHSplashScreenState createState() => BHSplashScreenState();
}

class BHSplashScreenState extends State<BHSplashScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async{
    Timer(Duration(seconds: 3), () {
      finish(context);
      var launch = WelcomeScreen().launch(context);
    });
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:
        Image.asset('images/hairSalon/liveparlours_logo.png'),

      ),
    );
  }
}