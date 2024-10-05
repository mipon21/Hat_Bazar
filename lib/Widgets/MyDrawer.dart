import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hat_bazar/Config/AssetsPath.dart';
import 'package:hat_bazar/Providers/draverProvider.dart';
import 'package:hat_bazar/Widgets/MyDrawerMenu.dart';
import 'package:hat_bazar/Widgets/ThemeChangerBtn.dart';
import 'package:provider/provider.dart';

class Mydrawer extends StatelessWidget {
  const Mydrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final drawerProvider = Provider.of<DrawerProvider>(context, listen: false);
    return Consumer<DrawerProvider>(builder: (context, value, child) {
      return Drawer(
        width: 250,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DrawerHeader(
                  child: SvgPicture.asset(
                IconAssets.appIcon,
                fit: BoxFit.contain,
              )),
              Container(
                padding: EdgeInsets.all(5),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: "Search here...",
                          fillColor: Theme.of(context).colorScheme.background,
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer,
                          )),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    MyDrawerMenu(
                      title: "Dashboard",
                      icon: IconAssets.catagory,
                      onPressed: () {
                        drawerProvider.selectMenu(0); // Use the new method
                        Scaffold.of(context).closeDrawer();
                      },
                      isSelected: drawerProvider.selectedPageIndex == 0,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    MyDrawerMenu(
                      title: "Products",
                      icon: IconAssets.person,
                      onPressed: () {
                        drawerProvider.selectMenu(1);
                        Scaffold.of(context).closeDrawer();
                      },
                      isSelected: drawerProvider.selectedPageIndex == 1,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    MyDrawerMenu(
                      title: "Catagory",
                      icon: IconAssets.shop,
                      onPressed: () {
                        drawerProvider.selectMenu(2);
                        Scaffold.of(context).closeDrawer();
                      },
                      isSelected: drawerProvider.selectedPageIndex == 2,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    MyDrawerMenu(
                      title: "Coupons",
                      icon: IconAssets.coupons,
                      onPressed: () {
                        drawerProvider.selectMenu(3);
                        Scaffold.of(context).closeDrawer();
                      },
                      isSelected: drawerProvider.selectedPageIndex == 3,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    MyDrawerMenu(
                      title: "Settings",
                      icon: IconAssets.settings,
                      onPressed: () {
                        drawerProvider.selectMenu(4);
                        Scaffold.of(context).closeDrawer();
                      },
                      isSelected: drawerProvider.selectedPageIndex == 4,
                    ),                  
                  ],
                ),
              ),
              ThemeChangeBtn()
            ],
          ),
        ),
      );
    });
  }
}
