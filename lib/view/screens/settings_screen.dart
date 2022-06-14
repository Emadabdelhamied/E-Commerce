import 'package:ecommerce/utils/theme.dart';
import 'package:ecommerce/view/widgets/settings/dark_mode_switch.dart';
import 'package:ecommerce/view/widgets/settings/language.dart';
import 'package:ecommerce/view/widgets/settings/log_out.dart';
import 'package:ecommerce/view/widgets/settings/profile_detailes.dart';
import 'package:ecommerce/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            ProfileDetailes(),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(begin: Alignment.topRight, colors: [
                  Get.isDarkMode
                      ? yellowEmadClr.withOpacity(0.7)
                      : mainColor.withOpacity(.6),
                  Get.isDarkMode
                      ? yellowEmadClr.withOpacity(0.4)
                      : mainColor.withOpacity(.3),
                ]),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextUtils(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      text: 'General'.tr,
                      color: Get.isDarkMode ? darkEmadClr : Colors.black,
                      underLine: false,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    DarkModeSwitch(),
                    const SizedBox(
                      height: 20,
                    ),
                    Language(),
                    const SizedBox(height: 20,),
                    LogOut(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
