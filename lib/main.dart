// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:hat_bazar/Config/PageRoutes.dart';
import 'package:hat_bazar/Config/Theme.dart';
import 'package:hat_bazar/Pages/HomePage/HomePage.dart';
import 'package:hat_bazar/Providers/AddProductProvider.dart';
import 'package:hat_bazar/Providers/CategoryProvider.dart';
import 'package:hat_bazar/Providers/ThemeProvider.dart';
import 'package:hat_bazar/Providers/draverProvider.dart';
import 'package:hat_bazar/firebase_options.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => DrawerProvider()),
    ChangeNotifierProvider(create: (_) => AddProductProvider()),
    ChangeNotifierProvider(create: (_) => CategoryProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      builder: (context, child) {
        final themeProvider = Provider.of<ThemeProvider>(context);
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Hat Bazar',
          theme: lightTheme,
          themeMode: Provider.of<ThemeProvider>(context).themeData == darkTheme ? ThemeMode.dark : ThemeMode.light,
          darkTheme: darkTheme,
          routerConfig: router,
        );
      },
    );
  }
}
