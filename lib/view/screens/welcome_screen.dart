import 'package:ecommerce/logic/controller/loggedin_controller.dart';
import 'package:ecommerce/routes/routes.dart';
import 'package:ecommerce/utils/theme.dart';
import 'package:ecommerce/view/widgets/text_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    var pageContraller = PageController();
    List<OnBoard> boarding = [
      OnBoard(
        image: 'assets/images/onBoarding1.json',
        title: 'Find your favorite items',
      ),
      OnBoard(
        image: 'assets/images/onBoarding2.json',
        title: 'Save your money',
      ),
      OnBoard(
        image: 'assets/images/onBoarding3.json',
        title: 'Buy your favorite styles',
      ),
    ];
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white.withOpacity(0),
          elevation: 0,
          actions: [
            TextButton(
                onPressed: () {
                  Get.offNamed(Routes.loginScreen);
                  LoggedInController().changeRoute(true, false);
                },
                child: TextUtils(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  text: 'Skip',
                  color: mainColor,
                  underLine: false,
                ))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  physics: const BouncingScrollPhysics(),
                  controller: pageContraller,
                  onPageChanged: (int index) {
                    if (index == boarding.length - 1) {
                      setState(() {
                        isLast = true;
                      });
                    } else {
                      setState(() {
                        isLast = false;
                      });
                    }
                  },
                  itemBuilder: (BuildContext context, int index) =>
                      buildBoarding(boarding[index]),
                  itemCount: boarding.length,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              isLast
                  ? Center(
                      child: Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Get.offNamed(Routes.loginScreen);
                            //Controller().changeRoute(true);
                            LoggedInController().changeRoute(true, false);
                          },
                          child: TextUtils(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              text: 'Get Start',
                              color: Colors.black,
                              underLine: false),
                          style: ElevatedButton.styleFrom(
                              primary: mainColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 10)),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextUtils(
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                                text: 'Don\'t have an account ?',
                                color: Colors.black,
                                underLine: false),
                            TextButton(
                              onPressed: () {
                                Get.offNamed(Routes.signUpScreen);
                                //Controller().changeRoute(true);
                                LoggedInController().changeRoute(true, false);
                              },
                              child: TextUtils(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  text: 'Sign Up',
                                  color: Colors.black,
                                  underLine: true),
                            )
                          ],
                        )
                      ],
                    ))
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SmoothPageIndicator(
                          controller: pageContraller,
                          count: boarding.length,
                          effect: const ExpandingDotsEffect(
                              activeDotColor: mainColor,
                              dotHeight: 10,
                              dotWidth: 10,
                              spacing: 5,
                              expansionFactor: 3),
                        ),
                        const SizedBox(
                          height: 100,
                        ),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

class OnBoard {
  final String image;
  final String title;

  OnBoard({
    required this.image,
    required this.title,
  });
}

Widget buildBoarding(OnBoard model) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: Lottie.asset(model.image)),
        const SizedBox(
          height: 10,
        ),
        Text(
          model.title,
          style: const TextStyle(fontSize: 25),
        ),
      ],
    );
