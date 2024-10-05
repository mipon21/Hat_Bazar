import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/state_manager.dart';


class Themecontroler extends GetxController {

    RxBool isDark = false.obs;
    void changeTheme() async {
      isDark.value = !isDark.value;
      
      Get.changeThemeMode(
        isDark.value ? ThemeMode.dark : ThemeMode.light);
  }
}