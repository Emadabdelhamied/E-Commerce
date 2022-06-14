import 'package:ecommerce/logic/controller/main_controller.dart';
import 'package:ecommerce/logic/controller/settingsController.dart';
import 'package:get/get.dart';

class MainBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(MainController());
    Get.put(SettingsController());
  }

}