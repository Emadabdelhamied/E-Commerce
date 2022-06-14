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

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final Controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        backgroundColor: context.theme.backgroundColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.75,
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
                            color: Get.isDarkMode?yellowEmadClr : mainColor,
                            underLine: false,
                          ),
                          TextUtils(
                            fontSize: 28,
                            fontWeight: FontWeight.w500,
                            text: ' UP',
                            color: Get.isDarkMode?Colors.white:Colors.black,
                            underLine: false,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      AuthTextFormField(
                        controller: nameController,
                        keyboardType: TextInputType.text,
                        validator: (String value) {
                          if (value.length <= 2 ||
                              !RegExp(validationName).hasMatch(value)) {
                            return 'Enter Valid Name';
                          } else {
                            return null;
                          }
                        },
                        prefixIcon: SvgPicture.asset(
                          'assets/images/email.svg',
                          fit: BoxFit.scaleDown,
                          width: 10,
                          height: 10,
                          color:Get.isDarkMode?darkEmadClr:Colors.black,
                        ),
                        suffixIcon: const Text(""),
                        hintText: 'User Name',
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
                        prefixIcon: SvgPicture.asset(
                          'assets/images/person.svg',
                          fit: BoxFit.scaleDown,
                          width: 10,
                          height: 10,
                          color:Get.isDarkMode?darkEmadClr:Colors.black,
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
                          obscureText: Controller.isVisibility,
                          keyboardType: TextInputType.text,
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
                              color: Get.isDarkMode?darkEmadClr: mainColor,
                              onPressed: () {
                                Controller.visibility();
                              },
                              icon: Controller.isVisibility
                                  ? const Icon(Icons.visibility)
                                  : const Icon(Icons.visibility_off)),
                          hintText: 'Password',
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          CheckedBox(),
                          const SizedBox(
                            width: 10,
                          ),
                          TextUtils(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            text: 'I accept',
                            color: Get.isDarkMode?yellowEmadClr : Colors.black,
                            underLine: false,
                          ),
                          TextUtils(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            text: ' terms & conditions',
                            color: Get.isDarkMode?yellowEmadClr : Colors.black,
                            underLine: true,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      GetBuilder<AuthController>(builder: (_) {
                        return AuthButton(
                            onPressed: () async {
                              String name = nameController.text.trim();
                              String email = emailController.text;
                              String password = passwordController.text;
                              if (formKey.currentState!.validate()) {
                                if (Controller.isChecked == true) {
                                  AuthController().signUpFirebase(
                                      name: name,
                                      email: email,
                                      password: password);
                                  Get.offNamed(Routes.loginScreen);
                                } else {
                                  Controller.snackBar(title: 'Check Box',
                                      message: 'Please, Accept terms & conditions ');
                                }
                              }
                            },
                            text: 'SIGN UP');
                      })
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 23,),
            BottomContainer(
              text: 'Already have an account ?',
              buttonText: 'Sign in',
              onPressed: () {
                Get.offNamed(Routes.loginScreen);
              },
            )
          ],
        ),
      ),
    );
  }
}
