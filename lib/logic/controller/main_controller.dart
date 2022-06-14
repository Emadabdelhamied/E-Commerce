import 'package:ecommerce/view/screens/category_screen.dart';
import 'package:ecommerce/view/screens/favorites_screen.dart';
import 'package:ecommerce/view/screens/homeScreen.dart';
import 'package:ecommerce/view/screens/settings_screen.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  RxInt currentIndex = 0.obs;
  final tabs = [
    HomeScreen(),
    CategoryScreen(),
    FavoritesScreen(),
    SettingScreen(),
  ].obs;
  final titels = [
    'E Commerce',
    'Categories',
    'Favorites',
    'Settings'
  ];
}