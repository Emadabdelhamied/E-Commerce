import 'package:ecommerce/logic/controller/cart_controller.dart';
import 'package:ecommerce/model/product_model.dart';
import 'package:ecommerce/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../text_utils.dart';

class AddCart extends StatelessWidget {
  AddCart({Key? key, required this.model}) : super(key: key);
  final ProductModel model;
  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: Row(
        children: [
          Column(
            children: [
              TextUtils(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                text: 'Price'.tr,
                color:Get.isDarkMode?Colors.white: Colors.grey,
                underLine: false,
              ),
              const SizedBox(
                height: 5,
              ),
              TextUtils(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                text: '\$ ${model.price}',
                color: Get.isDarkMode?yellowEmadClr:Colors.black,
                underLine: false,
              ),
            ],
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(begin: Alignment.topRight, colors: [
                  Get.isDarkMode?yellowEmadClr:mainColor,
                  Get.isDarkMode?yellowEmadClr.withOpacity(0.7):mainColor.withOpacity(.7),
                ]),
              ),
              child: TextButton(
                onPressed: () {
                  cartController.addProductToCart(model);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextUtils(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      text: 'Add Cart'.tr,
                      color:Get.isDarkMode?darkEmadClr:Colors.white,
                      underLine: false,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SvgPicture.asset(
                      'assets/images/cart.svg',
                      fit: BoxFit.scaleDown,
                      height: 30,
                      width: 30,
                      color:Get.isDarkMode?darkEmadClr:Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
