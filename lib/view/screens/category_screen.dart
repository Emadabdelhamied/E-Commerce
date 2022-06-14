import 'package:ecommerce/logic/controller/category_controller.dart';
import 'package:ecommerce/utils/theme.dart';
import 'package:ecommerce/view/widgets/categoryItems.dart';
import 'package:ecommerce/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:vertical_card_pager/vertical_card_pager.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({Key? key}) : super(key: key);
  var controller = Get.put(CategoryController());

  var titles = [
    "",
    "",
    "",
    "",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Padding(
          padding: const EdgeInsets.all(10.0),
          child:VerticalCardPager(
            initialPage: 0,
            titles: titles,
            images: [
              Material(
                elevation: 35,
                borderRadius:BorderRadius.circular(30),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: LinearGradient(begin: Alignment.topRight, colors: [
                      Get.isDarkMode
                          ? yellowEmadClr
                          : mainColor.withOpacity(.6),
                      Get.isDarkMode
                          ? yellowEmadClr.withOpacity(0.7)
                          : mainColor.withOpacity(.3),
                    ]),
                  ),
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Hero(
                        tag: "Electronics",
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Lottie.asset(
                            "assets/images/electronics.json",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        height: 30,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              bottomRight: Radius.circular(30),
                              bottomLeft: Radius.circular(30)),
                          color: Colors.black.withOpacity(
                            0.3,
                          ),
                        ),
                        child: Center(
                          child: TextUtils(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            text:'Electronics'.tr,
                            color: Colors.white,
                            underLine: false,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Material(
                elevation: 35,
                borderRadius:BorderRadius.circular(30),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: LinearGradient(begin: Alignment.topRight, colors: [
                      Get.isDarkMode
                          ? yellowEmadClr
                          : mainColor.withOpacity(.6),
                      Get.isDarkMode
                          ? yellowEmadClr.withOpacity(0.7)
                          : mainColor.withOpacity(.3),
                    ]),
                  ),
                  child: InkWell(
                    onTap: () {},
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Hero(
                          tag: "Jewelry",
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Lottie.asset(
                              "assets/images/Jewelry.json",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          height: 30,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                bottomRight: Radius.circular(30),
                                bottomLeft: Radius.circular(30)),
                            color: Colors.black.withOpacity(
                              0.3,
                            ),
                          ),
                          child: Center(
                            child: TextUtils(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              text: 'Jewelry'.tr,
                              color: Colors.white,
                              underLine: false,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Material(
                elevation: 35,
                borderRadius:BorderRadius.circular(30),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: LinearGradient(begin: Alignment.topRight, colors: [
                      Get.isDarkMode
                          ? yellowEmadClr
                          : mainColor.withOpacity(.6),
                      Get.isDarkMode
                          ? yellowEmadClr.withOpacity(0.7)
                          : mainColor.withOpacity(.3),
                    ]),
                  ),
                  child: InkWell(
                    onTap: () {},
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Hero(
                          tag: "men's clothing",
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Lottie.asset(
                              "assets/images/man.json",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          height: 30,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                bottomRight: Radius.circular(30),
                                bottomLeft: Radius.circular(30)),
                            color: Colors.black.withOpacity(
                              0.3,
                            ),
                          ),
                          child: Center(
                            child: TextUtils(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              text: 'men\'s clothing'.tr,
                              color: Colors.white,
                              underLine: false,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Material(
                elevation: 35,
                borderRadius:BorderRadius.circular(30),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: LinearGradient(begin: Alignment.topRight, colors: [
                      Get.isDarkMode
                          ? yellowEmadClr
                          : mainColor.withOpacity(.6),
                      Get.isDarkMode
                          ? yellowEmadClr.withOpacity(0.7)
                          : mainColor.withOpacity(.3),
                    ]),
                  ),
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Hero(
                        tag: "women's clothing",
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Lottie.asset(
                            "assets/images/girl.json",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        height: 30,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              bottomRight: Radius.circular(30),
                              bottomLeft: Radius.circular(30)),
                          color: Colors.black.withOpacity(
                            0.3,
                          ),
                        ),
                        child: Center(
                          child: TextUtils(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            text: 'women\'s clothing'.tr,
                            color: Colors.white,
                            underLine: false,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
            onSelectedItem: (index){
              controller.getCategoryIndex(index);
              Get.to(()=>CategoryItem(title:controller.categoryList[index],));
            },
          )
      ),
    );
  }
}
