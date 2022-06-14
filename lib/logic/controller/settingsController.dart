import 'package:ecommerce/utils/my-strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SettingsController extends GetxController {
  var switchValue = false.obs;
  var localLang = ene;
  var storge = GetStorage();

  @override
  void onInit() async {
    localLang = await getLanguage;
    super.onInit();
  }

  void saveLanguage(String lang) async {
    await storge.write("lang", lang);
  }

  Future<String> get getLanguage async {
    return await storge.read("lang");
  }

  void changeLanguage(String language) {
    if (localLang == language) {
      return;
    }
    if (language == ene) {
      localLang = ene;
      saveLanguage(ene);
    } else if (language == ara) {
      localLang = ara;
      saveLanguage(ara);
    } else {
      localLang = frf;
      saveLanguage(frf);
    }
    update();
  }
}
