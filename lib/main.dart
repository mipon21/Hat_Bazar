// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hat_bazar/Config/PageRoutes.dart';
import 'package:hat_bazar/Config/Theme.dart';
import 'package:hat_bazar/Pages/HomePage/HomePage.dart';
import 'package:hat_bazar/Providers/AddProductProvider.dart';
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
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Hat Bazar',
      theme: lightTheme,
      themeMode: ThemeMode.dark,
      darkTheme: darkTheme,
      routerConfig: router,
    );
  }
}
