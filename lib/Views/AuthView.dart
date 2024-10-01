// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hat_bazar/Pages/Mobile/Auth/Auth.dart';
import 'package:hat_bazar/Pages/Web/Auth/Auth.dart';
import 'package:hat_bazar/Widgets/ResponsiveLayout.dart';

class Authview extends StatelessWidget {
  const Authview({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsivelayout(
        mobile: AuthPage(),
        desktop: WebAuthPage()
    );
  }
}
