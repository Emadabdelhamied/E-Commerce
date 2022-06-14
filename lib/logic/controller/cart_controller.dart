import 'package:ecommerce/logic/controller/auth.dart';
import 'package:ecommerce/model/product_model.dart';
import 'package:ecommerce/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CartController extends GetxController {
  var productMap = {}.obs;
  var storage=GetStorage();
  void addProductToCart(ProductModel productModel)async{
    if (productMap.containsKey(productModel)) {
      productMap[productModel] += 1;
      await storage.write('cart', productMap);
    } else {
      productMap[productModel] = 1;
    }
  }

  void removeOneProductFromCart(ProductModel productModel)async {
    productMap.removeWhere((key, value) => key == productModel);
    await storage.write('cart', productMap);
  }

  void removeProductsFromCart(ProductModel productModel)async {
    if (productMap.containsKey(productModel) && productMap[productModel] == 1) {
      productMap.removeWhere((key, value) => key == productModel);
      await storage.write('cart', productMap);
    } else {
      productMap[productModel] -= 1;
      await storage.write('cart', productMap);
    }
  }

  void clearCart() {
    if (productMap.isNotEmpty) {
      Get.defaultDialog(
          title: 'Clear Cart !',
          middleText: 'Are you sure you want to remove all items?',
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
            productMap.clear();
            Get.back();
          });
    } else {
      AuthController().snackBar(title: 'Cart', message: 'your Cart is empty');
      storage.remove('cart');
    }
  }

  get productSubTotal => productMap.entries
      .map((element) => element.key.price * element.value)
      .toList();

  get productsTotalPrice => productMap.entries
      .map((element) => element.key.price * element.value)
      .toList()
      .reduce((value, element) => value + element)
      .toStringAsFixed(2);

  int quantity() => productMap.isNotEmpty
      ? productMap.entries
          .map((element) => element.value)
          .toList()
          .reduce((value, element) => value + element)
      : 0;
}
