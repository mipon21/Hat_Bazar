// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hat_bazar/Config/AssetsPath.dart';
import 'package:hat_bazar/Config/Colors.dart';
import 'package:hat_bazar/Pages/Dashboard/Dashboard.dart';
import 'package:hat_bazar/Providers/draverProvider.dart';
import 'package:hat_bazar/Widgets/MyAppBar.dart';
import 'package:hat_bazar/Widgets/MyDrawer.dart';
import 'package:hat_bazar/Widgets/MyDrawerMenu.dart';
import 'package:hat_bazar/Widgets/ResponsiveLayout.dart';
import 'package:provider/provider.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final drawerProvider = Provider.of<DrawerProvider>(context, listen: false);
    final isDesktop = Responsivelayout.isDesktop(context);
    return Scaffold(
      drawer: isDesktop ? null : Mydrawer(),
      body: SafeArea(
          child: Row(
        children: [
          if (isDesktop) Expanded(child: Mydrawer()),
          Expanded(
              flex: 6,
              child: Column(
                children: [
                  MyAppBar(),
                  SizedBox(height: 20,),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                          padding: const EdgeInsets.only(left: 16, top: 16),
                          child: Consumer<DrawerProvider>(
                              builder: (context, value, child) =>
                                  value.pages[value.selectedPageIndex])),
                    ),
                  )
                ],
              )),
        ],
      )),
    );
  }
}
