import 'package:ecommerce/logic/controller/product_controller.dart';
import 'package:ecommerce/utils/theme.dart';
import 'package:ecommerce/view/widgets/home/search.dart';
import 'package:get/get.dart';
import '../widgets/home/category_card.dart';
import 'package:ecommerce/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  var controller=Get.find<ProductController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: SafeArea(
        child:Container(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient:
                      LinearGradient(begin: Alignment.bottomRight, colors: [
                        Get.isDarkMode?yellowEmadClr.withOpacity(0.6):mainColor.withOpacity(.6),
                        Get.isDarkMode?yellowEmadClr.withOpacity(0.3):mainColor.withOpacity(.3),
                      ])),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        TextUtils(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          text: 'Life style Sale',
                          color:Get.isDarkMode?darkEmadClr :Colors.black,
                          underLine: false,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        SearchField(),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: TextUtils(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  text: 'Category',
                  color:Get.isDarkMode?yellowEmadClr: Colors.black,
                  underLine: false,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              CategoryCard(),
            ],
          ),
        ),
      ),
    );
  }
}
