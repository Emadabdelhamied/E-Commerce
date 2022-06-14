import 'package:cool_dropdown/cool_dropdown.dart';
import 'package:ecommerce/logic/controller/settingsController.dart';
import 'package:ecommerce/utils/my-strings.dart';
import 'package:ecommerce/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../text_utils.dart';

class Language extends StatelessWidget {
  Language({Key? key}) : super(key: key);
  final controller = Get.find<SettingsController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingsController>(
      builder: (_) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextUtils(
            fontSize: 18,
            fontWeight: FontWeight.normal,
            text: 'Language'.tr,
            color: Get.isDarkMode ? darkEmadClr : Colors.black,
            underLine: false,
          ),
          CoolDropdown(
            dropdownList: [
              {'label': arabic, 'value': ara},
              {'label': english, 'value': ene},
              {'label': french, 'value': frf}, // label is required and unique
            ],
            defaultValue: {'label': Maping[controller.localLang], 'value': controller.localLang},
            onChange: (value) {
              Get.updateLocale(Locale(value['value']));
            },
            resultWidth: 80,
            dropdownHeight: 170,
            dropdownWidth: 70,
            resultHeight: 30,
            iconSize: 10,
            dropdownBD: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: darkEmadClr.withOpacity(0.7),
              gradient: LinearGradient(begin: Alignment.topRight, colors: [
                Get.isDarkMode ? darkEmadClr : mainColor.withOpacity(.6),
                Get.isDarkMode
                    ? darkEmadClr.withOpacity(0.7)
                    : mainColor.withOpacity(.3),
              ]),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 10,
                  offset: Offset(0, 1),
                ),
              ],
            ),
            selectedItemBD: BoxDecoration(
              color: Color(0XFFEFFAF0),
              gradient: LinearGradient(begin: Alignment.topRight, colors: [
                Get.isDarkMode ? yellowEmadClr.withOpacity(0.7) : Colors.white,
                Get.isDarkMode ? yellowEmadClr.withOpacity(0.4) : Colors.white,
              ]),
              borderRadius: BorderRadius.circular(10),
            ),
          )
        ],
      ),
    );
  }
}
