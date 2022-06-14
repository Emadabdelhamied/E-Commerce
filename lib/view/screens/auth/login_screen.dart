import 'package:ecommerce/logic/controller/auth.dart';
import 'package:ecommerce/routes/routes.dart';
import 'package:ecommerce/utils/my-strings.dart';
import 'package:ecommerce/utils/theme.dart';
import 'package:ecommerce/view/widgets/auth/auth_text_form_field.dart';
import 'package:ecommerce/view/widgets/auth/bottom_container.dart';
import 'package:ecommerce/view/widgets/auth/button.dart';
import 'package:ecommerce/view/widgets/auth/checked_box.dart';
import 'package:ecommerce/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor:context.theme.backgroundColor,
        ),
        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.75,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25,),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        MediaQuery.of(context).viewInsets.bottom == 0?const SizedBox(height: 40,):const SizedBox(height: 0,),
                        Row(
                          children: [
                            TextUtils(
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                              text: 'SIGN',
                              color:Get.isDarkMode?yellowEmadClr:mainColor,
                              underLine: false,
                            ),
                            TextUtils(
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                              text: ' IN',
                              color:Get.isDarkMode?Colors.white:Colors.black,
                              underLine: false,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        AuthTextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: (String value) {
                            if (value.isEmpty ||
                                !RegExp(validationEmail).hasMatch(value)) {
                              return 'Invalid E-mail';
                            } else {
                              return null;
                            }
                          },
                          prefixIcon: SizedBox(
                            height: 10,
                            width: 10,
                            child: SvgPicture.asset(
                              'assets/images/person.svg',
                              fit: BoxFit.scaleDown,
                              width: 10,
                              height: 10,
                              color:Get.isDarkMode?darkEmadClr:Colors.black,
                            ),
                          ),
                          suffixIcon: const Text(""),
                          hintText: 'Email',
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        GetBuilder<AuthController>(
                          builder: (_) => AuthTextFormField(
                            controller: passwordController,
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: controller.isVisibility,
                            validator: (String value) {
                              if (value.length < 6) {
                                return 'Short Password';
                              }
                            },
                            prefixIcon: SvgPicture.asset(
                              'assets/images/lock.svg',
                              fit: BoxFit.scaleDown,
                              width: 10,
                              height: 10,
                              color: Get.isDarkMode?darkEmadClr:Colors.black,
                            ),
                            suffixIcon: IconButton(
                                color:Get.isDarkMode?darkEmadClr:mainColor,
                                onPressed: () {
                                  controller.visibility();
                                },
                                icon: controller.isVisibility
                                    ? const Icon(Icons.visibility)
                                    : const Icon(Icons.visibility_off)),
                            hintText: 'Password',
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                                onPressed: () {
                                  Get.toNamed(Routes.forgetPassword);
                                },
                                child: TextUtils(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  text: 'Forget Password ?',
                                  color:Get.isDarkMode?yellowEmadClr :Colors.black,
                                  underLine: false,
                                )),
                          ],
                        ),
                        Row(
                          children: [
                            CheckedBox(),
                            const SizedBox(
                              width: 5,
                            ),
                            TextUtils(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              text: 'Remember Me',
                              color:Get.isDarkMode?yellowEmadClr :Colors.black,
                              underLine: false,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        GetBuilder<AuthController>(builder: (_) {
                          return AuthButton(
                              onPressed: () async {
                                if (formKey.currentState!.validate()) {
                                  AuthController().signInFirebase(
                                      email: emailController.text.trim(),
                                      password: passwordController.text);
                                }
                              },
                              text: 'LOG IN');
                        }),
                        const SizedBox(
                          height: 30,
                        ),
                        TextUtils(
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            text: 'OR',
                            color:Get.isDarkMode?yellowEmadClr: Colors.black,
                            underLine: false),
                        const SizedBox(
                          height: 30,
                        ),
                        GetBuilder<AuthController>(builder: (_){
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                child: SvgPicture.asset(
                                  'assets/images/facebook.svg',
                                  width: 40,
                                  height: 40,
                                ),
                                onPressed: () {
                                  controller.signInUsingFacebook();
                                },
                              ),
                              TextButton(
                                child: SvgPicture.asset(
                                  'assets/images/google.svg',
                                  width: 40,
                                  height: 40,
                                ),
                                onPressed: () {
                                  controller.signInUsingGoogle();
                                },
                              ),
                            ],
                          );
                        }),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 23,),
              BottomContainer(
                text: 'Don\'t have an account ? ',
                buttonText: 'Sign Up',
                onPressed: () {
                  Get.offNamed(Routes.signUpScreen);
                },
              )
            ],
          ),
        ));
  }
}
