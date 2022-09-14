import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:super_flutter/super_flutter.dart';

import '../../../core/utils/my_string.dart';

class SettingController extends GetxController {
  var themeMode = Rx<ThemeMode>(AppStorage.getThemeMode);

  var swithchValue = false.obs;
  var storage = GetStorage();
  var langLocal = ene;


  @override
  void onInit() async {
    super.onInit();

    langLocal = await getLanguage;
  }

  void saveLanguage(String lang) async {
    await storage.write("lang", lang);
  }

  Future<String> get getLanguage async => await storage.read("lang") ?? ene;

  void changeLanguage(String typeLang) {
    saveLanguage(typeLang);
    if (langLocal == typeLang) return;
    if (typeLang == frf) {
      langLocal = frf;
      saveLanguage(frf);
    } else if (typeLang == ara) {
      langLocal = ara;
      saveLanguage(ara);
    } else {
      langLocal = ene;
      saveLanguage(ene);
    }
    update();
  }

  void changeTheme() {
    themeMode.value =
        themeMode.value == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    Get.changeThemeMode(themeMode.value);
    AppStorage.setThemeMode = themeMode.value;
  }
}
