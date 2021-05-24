import 'package:flutter/material.dart';
import 'package:cobamodul5/splashscreen_view.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Splash Screen',
    theme: ThemeData.dark(),
    home: SplashScreenPage(),
  ));
}