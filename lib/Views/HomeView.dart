import 'package:flutter/material.dart';
import 'package:hat_bazar/Pages/Mobile/HomePage/HomePage.dart';
import 'package:hat_bazar/Pages/Web/HomePage/HomePage.dart';
import 'package:hat_bazar/Widgets/ResponsiveLayout.dart';

class HomePageview extends StatelessWidget {
  const HomePageview({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsivelayout(mobile: HomePage(), desktop: WebHomePage());
  }
}