import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hat_bazar/Config/AssetsPath.dart';
import 'package:hat_bazar/Providers/draverProvider.dart';
import 'package:hat_bazar/Widgets/MyDrawerMenu.dart';
import 'package:provider/provider.dart';

class Mydrawer extends StatelessWidget {
  const Mydrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final drawerProvider = Provider.of<DrawerProvider>(context, listen: false);
    return Consumer<DrawerProvider>(builder: (context, value, child) {
            return Drawer(
              child: SingleChildScrollView(
                child: Column(
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
                ),
              ),
            );
          });
  }
}