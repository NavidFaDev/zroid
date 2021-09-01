import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:zroid/pages/details.dart';
import 'package:zroid/pages/home.dart';
import 'package:zroid/pages/splash.dart';

void main() {
  setPathUrlStrategy();
  runApp(MaterialApp(
    theme: ThemeData(fontFamily: 'Montserrat'),
    initialRoute: '/',
    routes: {
      '/': (context) => Splash(),
      '/home': (context) => Home(),
      '/details': (context) => Details()
    },
  ));
}



