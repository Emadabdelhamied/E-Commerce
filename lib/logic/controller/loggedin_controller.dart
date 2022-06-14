import 'package:ecommerce/routes/routes.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoggedInController extends GetxController {
  final box = GetStorage();
  bool get seen => box.read('WelcomeScreen') ?? false;
  bool get loggedIn=>box.read('auth')??false;
  String get initialRoute {
    if (seen==true && loggedIn==true) {return Routes.mainScreen;}
    else if (seen==true && loggedIn==false) {return Routes.loginScreen;}
    else {return AppRoutes.welcome;}
  }

  void changeRoute(bool seen,bool auth){
    box.write('WelcomeScreen', seen);
    box.write('auth', auth);
  }
}
