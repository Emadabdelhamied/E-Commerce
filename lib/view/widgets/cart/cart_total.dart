import 'package:ecommerce/logic/controller/cart_controller.dart';
import 'package:ecommerce/utils/theme.dart';
import 'package:ecommerce/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CartTotal extends StatelessWidget {
  CartTotal({Key? key}) : super(key: key);
  var controller = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Row(
        children: [
          Column(
            children: [
              TextUtils(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                text: 'Total'.tr,
                color:Get.isDarkMode?yellowEmadClr:Colors.grey,
                underLine: false,
              ),
              const SizedBox(
                height: 5,
              ),
              Obx(()=>TextUtils(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                text: '\$ ${controller.productsTotalPrice}',
                color:Get.isDarkMode?yellowEmadClr:Colors.black,
                underLine: false,
              ),),
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
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextUtils(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      text: 'Check Out'.tr,
                      color:Get.isDarkMode?darkEmadClr: Colors.white,
                      underLine: false,
                    ),
                    const SizedBox(width: 10,),
                    SvgPicture.asset(
                      'assets/images/cart.svg',
                      fit: BoxFit.scaleDown,
                      height: 30,
                      width: 30,
                      color:Get.isDarkMode?darkEmadClr: Colors.white,
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
