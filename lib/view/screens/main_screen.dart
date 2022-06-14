import 'package:badges/badges.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:ecommerce/logic/controller/cart_controller.dart';
import 'package:ecommerce/logic/controller/main_controller.dart';
import 'package:ecommerce/routes/routes.dart';
import 'package:ecommerce/utils/theme.dart';
import 'package:ecommerce/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  final controller = Get.find<MainController>();
  final cartController = Get.find<CartController>();

  MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          backgroundColor: Colors.white,
          // backgroundColor: mainColor,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(begin: Alignment.topCenter, colors: [
                Get.isDarkMode
                    ? yellowEmadClr.withOpacity(0.6)
                    : mainColor.withOpacity(.6),
                Get.isDarkMode
                    ? yellowEmadClr.withOpacity(0.3)
                    : mainColor.withOpacity(.3),
              ]),
            ),
          ),
          elevation: 0,
          title: TextUtils(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            text: controller.titels[controller.currentIndex.value].tr,
            color: Get.isDarkMode ? darkEmadClr : Colors.white,
            underLine: false,
          ),
          actions: [
            Badge(
              position: BadgePosition.topEnd(top: 0, end: 4),
              badgeContent: Text(cartController.quantity().toString()),
              animationDuration: const Duration(milliseconds: 500),
              animationType: BadgeAnimationType.scale,
              child: IconButton(
                onPressed: () {
                  Get.toNamed(Routes.cartScreen);
                },
                icon: SvgPicture.asset(
                  'assets/images/cart.svg',
                  height: 30,
                  width: 30,
                  fit: BoxFit.scaleDown,
                  color: Colors.black.withOpacity(0.6),
                ),
              ),
            ),
          ],
        ),
        extendBody: true,
        body: Stack(
          children: [
            IndexedStack(
              index: controller.currentIndex.value,
              children: controller.tabs.value,
            ),
            Align(
              alignment: FractionalOffset.bottomCenter,
              child: MediaQuery.of(context).viewInsets.bottom == 0
                  ? DotNavigationBar(
                      curve: Curves.decelerate,
                      currentIndex: controller.currentIndex.value,
                      backgroundColor: Get.isDarkMode
                          ? yellowEmadClr.withOpacity(0.6)
                          : mainColor.withOpacity(0.6),
                      onTap: (index) {
                        controller.currentIndex.value = index;
                      },
                      items: [
                        DotNavigationBarItem(
                            icon: const Icon(Icons.home),
                            selectedColor:
                                Get.isDarkMode ? darkEmadClr : Colors.white,
                            unselectedColor: Get.isDarkMode
                                ? darkEmadClr.withOpacity(0.4)
                                : Colors.white),
                        DotNavigationBarItem(
                            icon: const Icon(Icons.category),
                            selectedColor:
                                Get.isDarkMode ? darkEmadClr : Colors.white,
                            unselectedColor: Get.isDarkMode
                                ? darkEmadClr.withOpacity(0.4)
                                : Colors.white),
                        DotNavigationBarItem(
                            icon: const Icon(Icons.favorite),
                            selectedColor:
                                Get.isDarkMode ? darkEmadClr : Colors.white,
                            unselectedColor: Get.isDarkMode
                                ? darkEmadClr.withOpacity(0.4)
                                : Colors.white),
                        DotNavigationBarItem(
                            icon: const Icon(Icons.settings),
                            selectedColor:
                                Get.isDarkMode ? darkEmadClr : Colors.white,
                            unselectedColor: Get.isDarkMode
                                ? darkEmadClr.withOpacity(0.4)
                                : Colors.white),
                      ],
                    )
                  : const SizedBox(
                      height: 0,
                    ),
            ),
          ],
        ),
      );
    });
  }
}
