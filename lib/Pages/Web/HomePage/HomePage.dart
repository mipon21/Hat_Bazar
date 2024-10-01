// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hat_bazar/Config/AssetsPath.dart';
import 'package:hat_bazar/Config/Colors.dart';
import 'package:hat_bazar/Pages/Web/Dashboard/Dashboard.dart';
import 'package:hat_bazar/Providers/draverProvider.dart';
import 'package:hat_bazar/Views/DashboardView.dart';
import 'package:hat_bazar/Widgets/MyAppBar.dart';
import 'package:hat_bazar/Widgets/MyDrawerMenu.dart';
import 'package:hat_bazar/Widgets/Ourpage.dart';
import 'package:provider/provider.dart';

class WebHomePage extends StatelessWidget {
  const WebHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final drawerProvider = Provider.of<DrawerProvider>(context, listen: false);
    return Scaffold(
      body: SafeArea(
          child: Row(
        children: [
          Expanded(
              child: Consumer<DrawerProvider>(builder: (context, value, child) {
            return Column(
              children: [
                DrawerHeader(
                    child: SvgPicture.asset(
                  IconAssets.appIcon,
                )),
                MyDrawerMenu(
                  title: "Dashboard",
                  icon: IconAssets.catagory,
                  onPressed: () {
                  drawerProvider.selectMenu(0); // Use the new method
                  },
                  isSelected: drawerProvider.selectedPageIndex == 0,
                ),
                MyDrawerMenu(
                  title: "Products",
                  icon: IconAssets.person,
                  onPressed: () {
                    drawerProvider.selectMenu(1);
                  },
                  isSelected: drawerProvider.selectedPageIndex == 1,
                ),
                MyDrawerMenu(
                  title: "Catagory",
                  icon: IconAssets.shop,
                  onPressed: () {
                    drawerProvider.selectMenu(2);
                  },
                  isSelected: drawerProvider.selectedPageIndex == 2,
                ),
                MyDrawerMenu(
                  title: "Coupons",
                  icon: IconAssets.coupons,
                  onPressed: () {
                    drawerProvider.selectMenu(3);
                  },
                  isSelected: drawerProvider.selectedPageIndex == 3,
                ),
                MyDrawerMenu(
                  title: "Settings",
                  icon: IconAssets.settings,
                  onPressed: () {
                    drawerProvider.selectMenu(4);
                  },
                  isSelected: drawerProvider.selectedPageIndex == 4,
                ),
              ],
            );
          })),
          Expanded(
              flex: 6,
              child: Column(
                children: [
                  MyAppBar(),
                  SizedBox(height: 50,),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Dashboardview() 
                  )
                ],
              )),
        ],
      )),
    );
  }
}

