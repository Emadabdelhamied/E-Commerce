import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:ecommerce/logic/controller/settingsController.dart';
import 'package:ecommerce/logic/controller/theme.dart';
import 'package:ecommerce/utils/theme.dart';
import 'package:ecommerce/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DarkModeSwitch extends StatelessWidget {
  DarkModeSwitch({Key? key}) : super(key: key);
  var controller = Get.find<SettingsController>();

  @override
  Widget build(BuildContext context) {
    return Obx(()=> Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextUtils(
          fontSize: 20,
          fontWeight: FontWeight.normal,
          text: 'Dark Mode'.tr,
          color: Get.isDarkMode ? darkEmadClr : Colors.black,
          underLine: false,
        ),
        SizedBox(
          height: 50,
          width: 80,
          child: DayNightSwitcher(
            isDarkModeEnabled: controller.switchValue.value,
            onStateChanged: change,
            dayBackgroundColor:Colors.blue.withOpacity(0.4),
            cloudsColor: Colors.white,
          ),
        ),
      ],
    ));
  }

  void change(
    bool value
  ) {
    ThemeController().changesTheme();
    controller.switchValue.value = value;
  }
}

