import 'package:ecommerce/logic/controller/auth.dart';
import 'package:ecommerce/utils/theme.dart';
import '../../screens/main_screen.dart';
import 'package:ecommerce/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class LogOut extends StatelessWidget {
  LogOut({Key? key}) : super(key: key);
  final controller=Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Obx(()=>Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextUtils(
          fontSize: 18,
          fontWeight: FontWeight.normal,
          text: 'Log Out'.tr,
          color: Get.isDarkMode ? darkEmadClr : Colors.black,
          underLine: false,
        ),
        controller.test.value?const SizedBox(height: 0,width: 0,): const SizedBox(height: 0,width: 0,),
        IconButton(
          onPressed: () { Get.defaultDialog(
              title: 'Log out',
              middleText: 'Are you sure you want to log out?',
              textCancel: 'Cancel',
              cancelTextColor: Colors.black,
              confirmTextColor: Colors.white,
              textConfirm: 'Ok',
              buttonColor: errorClr,
              backgroundColor: Colors.white.withOpacity(0.7),
              onCancel: () {
                Get.back();
              },
              onConfirm: () {
                AuthController().signOut();
                Get.offAll(MainScreen());
              });},
          icon: SvgPicture.asset(
            'assets/images/logout.svg',
            fit: BoxFit.scaleDown,
            height: 40,
            width: 40,
            color: Get.isDarkMode ? darkEmadClr : errorClr,
          ),
        )
      ],
    ),);
  }
}
