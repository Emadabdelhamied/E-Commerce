import 'package:ecommerce/language/localization.dart';
import 'package:ecommerce/logic/controller/product_controller.dart';
import 'package:ecommerce/logic/controller/theme.dart';
import 'package:ecommerce/routes/routes.dart';
import 'package:ecommerce/utils/my-strings.dart';
import 'package:ecommerce/utils/theme.dart';
import 'package:ecommerce/view/screens/auth/splashScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'logic/controller/loggedin_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.put(LoggedInController());
    Get.put(ProductController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      locale: Locale(GetStorage().read<String>("lang").toString()),
      fallbackLocale: Locale(ene),
      translations: LocalizationApp(),
      getPages: AppRoutes.routes,
      theme: ThemesApp.light,
      darkTheme: ThemesApp.dark,
      themeMode: ThemeController().themeDataGet,
      defaultTransition: Transition.leftToRightWithFade,
    );
  }
}
