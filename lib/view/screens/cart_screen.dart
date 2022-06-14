import 'package:ecommerce/logic/controller/cart_controller.dart';
import 'package:ecommerce/utils/theme.dart';
import 'package:ecommerce/view/screens/favorites_screen.dart';
import '../widgets/cart/cart-item.dart';
import '../widgets/cart/cart_total.dart';
import '../widgets/cart/empty_cart.dart';
import 'package:ecommerce/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);
  var controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Obx(()=>Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: Center(
          child: IconButton(
            icon: SvgPicture.asset(
              'assets/images/back-arrow.svg',
              fit: BoxFit.scaleDown,
              height: 30,
              width: 30,
            ),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        title: Center(
          child: TextUtils(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            text: 'Cart'.tr,
            color:Get.isDarkMode?darkEmadClr:Colors.white,
            underLine: false,
          ),
        ),
        actions: [
          Center(
            child: IconButton(
              icon: SvgPicture.asset(
                'assets/images/bin.svg',
                fit: BoxFit.scaleDown,
                height: 30,
                width: 30,
                color: errorClr,
              ),
              onPressed: () {
                controller.clearCart();
              },
            ),
          ),
        ],
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, colors: [
              Get.isDarkMode?yellowEmadClr.withOpacity(.6):mainColor.withOpacity(.6),
              Get.isDarkMode?yellowEmadClr.withOpacity(.3):mainColor.withOpacity(.3),
            ]),
          ),
        ),
        elevation: 0,
      ),
      body: controller.productMap.isEmpty?EmptyCart():Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height*0.78,
            width: double.infinity,
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => CartBuilder(
                  model: controller.productMap.keys.toList()[index],
                  index:index
              ),
              separatorBuilder: (context, index) =>const SizedBox(height: 0,),
              itemCount: controller.productMap.length,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 20, left: 20, top: 10, bottom: 10),
            child: CartTotal(),
          ),
        ],
      ),
    ),);
  }
}
