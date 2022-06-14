import 'package:ecommerce/logic/controller/cart_controller.dart';
import 'package:ecommerce/logic/controller/category_controller.dart';
import 'package:ecommerce/logic/controller/product_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(ProductController());
    Get.lazyPut(() => CartController());
    Get.put(CategoryController());
  }

}