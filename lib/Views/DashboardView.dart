import 'package:flutter/material.dart';
import 'package:hat_bazar/Pages/Mobile/Dashboard/Dashboard.dart';
import 'package:hat_bazar/Pages/Web/Dashboard/Dashboard.dart';
import 'package:hat_bazar/Widgets/ResponsiveLayout.dart';

class Dashboardview extends StatelessWidget {
  const Dashboardview({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsivelayout(mobile: Dashboard(), desktop: WebDashBoard());
  }
}