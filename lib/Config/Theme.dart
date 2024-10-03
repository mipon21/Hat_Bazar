// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hat_bazar/Config/Colors.dart';
var lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    surface: backgroundColor,
    primary: primaryColor,
    onSurface: dartOnBackgroundColor,
    primaryContainer: primaryContainerColor,
    onPrimaryContainer: onprimaryContainerColor
  ),
  textTheme: TextTheme(
    headlineMedium: TextStyle(
      fontFamily: "Poppins",
      fontSize: 25,
      fontWeight: FontWeight.w500,
      color: onBackgroundColor
    ),
    headlineSmall: TextStyle(
        fontFamily: "Poppins",
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: onBackgroundColor
    ),
    bodyMedium: TextStyle(
        fontFamily: "Poppins",
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: onBackgroundColor
    ),
    bodySmall: TextStyle(
        fontFamily: "Poppins",
        fontSize: 10,
        fontWeight: FontWeight.w500,
        color: onBackgroundColor
    ),
    labelMedium: TextStyle(
        fontFamily: "Poppins",
        fontSize: 10,
        fontWeight: FontWeight.w400,
        color: onprimaryContainerColor
    ),
  ),
);
var darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
    surface: darkBgColor,
    primary: darkPrimaryColor,
    onSurface: dartOnBackgroundColor,
    primaryContainer: darkSecondaryColor,
    onPrimaryContainer: onprimaryContainerColor
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: InputBorder.none,
    fillColor: darkBgColor,
    filled: true,
    hintStyle: TextStyle(
      fontFamily: "Poppins",
      fontSize: 15,
      fontWeight: FontWeight.w400,
      color: darkOnPrimaryContainerColor
    )
  ),
  textTheme: TextTheme(
    headlineMedium: TextStyle(
      fontFamily: "Poppins",
      fontSize: 25,
      fontWeight: FontWeight.w500,
      color: dartOnBackgroundColor
    ),
    headlineSmall: TextStyle(
        fontFamily: "Poppins",
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: dartOnBackgroundColor
    ),
    bodyMedium: TextStyle(
        fontFamily: "Poppins",
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: dartOnBackgroundColor
    ),
    bodySmall: TextStyle(
        fontFamily: "Poppins",
        fontSize: 10,
        fontWeight: FontWeight.w500,
        color: dartOnBackgroundColor
    ),
    labelMedium: TextStyle(
        fontFamily: "Poppins",
        fontSize: 10,
        fontWeight: FontWeight.w400,
        color: onprimaryContainerColor
    ),
    labelLarge: TextStyle(
        fontFamily: "Poppins",
        fontSize: 15,
        fontWeight: FontWeight.w400,
        color: onprimaryContainerColor
    ),
  ),

);