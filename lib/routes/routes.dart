import 'package:ecommerce/logic/binding/auth_binding.dart';
import 'package:ecommerce/logic/binding/home_binding.dart';
import 'package:ecommerce/logic/binding/main_binding.dart';
import 'package:ecommerce/view/screens/auth/forget_password.dart';
import 'package:ecommerce/view/screens/auth/login_screen.dart';
import 'package:ecommerce/view/screens/auth/signup_screen.dart';
import 'package:ecommerce/view/screens/cart_screen.dart';
import '../view/screens/main_screen.dart';
import 'package:ecommerce/view/screens/welcome_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
// initial Page
  static const welcome = Routes.welcomeScreen;

// get Pages

  static final routes = [
    GetPage(name: Routes.welcomeScreen, page: () => const WelcomeScreen()),
    GetPage(
      name: Routes.loginScreen,
      page: () => LoginScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.signUpScreen,
      page: () => SignUpScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.mainScreen,
      page: () => MainScreen(),
      bindings: [AuthBinding(), MainBinding(), HomeBinding()],
    ),
    GetPage(
      name: Routes.forgetPassword,
      page: () => ForgetPasswordScreen(),
    ),
    GetPage(
      name: Routes.cartScreen,
      page: () => CartScreen(),
      bindings: [AuthBinding(), HomeBinding()],
    ),
  ];
}

class Routes {
  static const welcomeScreen = '/welcomeScreen';
  static const loginScreen = '/loginScreen';
  static const signUpScreen = '/signUpScreen';
  static const forgetPassword = '/forgetPassword';
  static const mainScreen = '/mainScreen';
  static const splashScreen = '/splashScreen';
  static const cartScreen = '/cartScreen';
}
