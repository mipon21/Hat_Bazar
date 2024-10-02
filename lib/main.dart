// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hat_bazar/Config/PageRoutes.dart';
import 'package:hat_bazar/Config/Theme.dart';
import 'package:hat_bazar/Pages/HomePage/HomePage.dart';
import 'package:hat_bazar/Providers/draverProvider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_)=>DrawerProvider()),
    ],
    child: const MyApp()
    ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Hat Bazar',
      theme: lightTheme,
      themeMode: ThemeMode.system,
      darkTheme: darkTheme,
      routerConfig: router,
    );
  }
}
