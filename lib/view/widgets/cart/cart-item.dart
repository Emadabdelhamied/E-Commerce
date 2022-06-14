import 'package:ecommerce/logic/controller/cart_controller.dart';
import 'package:ecommerce/model/product_model.dart';
import 'package:ecommerce/utils/theme.dart';
import 'package:ecommerce/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartBuilder extends StatelessWidget {
  final ProductModel model;
  final int index;
  final controller=Get.put(CartController());
  CartBuilder({Key? key, required this.model,required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(()=>Dismissible(
      key: Key(model.id.toString()),
      child: Container(
        margin: const EdgeInsets.only(top: 5, left: 20, right: 20,bottom: 5),
        height: 130,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(begin: Alignment.topRight, colors: [
            Get.isDarkMode?yellowEmadClr.withOpacity(0.8):mainColor.withOpacity(.6),
            Get.isDarkMode?yellowEmadClr.withOpacity(0.5):mainColor.withOpacity(.3),
          ]),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Container(
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  image: DecorationImage(
                    image: NetworkImage(
                        model.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextUtils(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      text: model.title,
                      color: Colors.black,
                      underLine: false,
                    ),
                    const SizedBox(height: 20,),
                    TextUtils(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      text: '${controller.productSubTotal[index].toStringAsFixed(2)} \$',
                      color:Get.isDarkMode?darkEmadClr:mainColor,
                      underLine: false,
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  IconButton(onPressed: (){
                    controller.removeProductsFromCart(model);
                  }, icon: const Icon(Icons.remove_circle),),
                  TextUtils(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    text: '${controller.productMap.values.toList()[index]}'.tr,
                    color: Colors.black,
                    underLine: false,
                  ),
                  IconButton(onPressed: (){
                    controller.addProductToCart(model);
                  }, icon: const Icon(Icons.add_circle),),
                ],
              ),
            ],
          ),
        ),
      ),
      onDismissed: (direction) {
        // Remove Item
        controller.removeOneProductFromCart(model);
      },
    ),);
  }
}
