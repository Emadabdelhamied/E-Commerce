import 'package:ecommerce/logic/controller/loggedin_controller.dart';
import 'package:ecommerce/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    var d = const Duration(seconds: 7);
    Future.delayed(d, () {
      //Get.offNamed(Controller().initialRoute);
      Get.offNamed(LoggedInController().initialRoute);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Get.isDarkMode?darkEmadClr:Colors.white,
      appBar: AppBar(elevation: 0,backgroundColor:Get.isDarkMode?darkEmadClr:Colors.white,),
      body: SafeArea(
        child:Center(
          child: Lottie.asset('assets/images/splash.json',repeat: true,reverse: true),
        ),
      ),
    );
  }
}
