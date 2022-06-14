import 'package:ecommerce/logic/controller/auth.dart';
import 'package:ecommerce/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileDetailes extends StatelessWidget {
  ProfileDetailes({Key? key}) : super(key: key);
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.2,
      width: double.infinity,
      child: Row(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(
              controller.displayPhoto.value,
            ),
          ),
          const SizedBox(
            width: 25,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextUtils(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  text: controller.displayname.value,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  underLine: false,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextUtils(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  text: controller.displayEmail.value,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  underLine: false,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
