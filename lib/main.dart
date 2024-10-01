// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hat_bazar/Config/Theme.dart';
import 'package:hat_bazar/Pages/Web/HomePage/HomePage.dart';
import 'package:hat_bazar/Views/AuthView.dart';
import 'package:hat_bazar/Views/HomeView.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hat Bazar',
      theme: lightTheme,
      themeMode: ThemeMode.system,
      darkTheme: darkTheme,
      home: const HomePageview(),
    );
  }
}
