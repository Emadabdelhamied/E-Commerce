import 'package:ecommerce/logic/controller/auth.dart';
import 'package:ecommerce/utils/my-strings.dart';
import 'package:ecommerce/view/widgets/auth/auth_text_form_field.dart';
import 'package:ecommerce/view/widgets/auth/button.dart';
import 'package:ecommerce/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({Key? key}) : super(key: key);
  final TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        backgroundColor: context.theme.backgroundColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: Center(
          child: IconButton(
            icon: SvgPicture.asset(
              'assets/images/back-arrow.svg',
              fit: BoxFit.scaleDown,
              height: 30,
              width: 30,
              color: Get.isDarkMode ? Colors.white : Colors.black,
            ),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        title: TextUtils(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          text: 'Forget Password',
          color: Get.isDarkMode ? Colors.white : Colors.black,
          underLine: false,
        ),
      ),
      body: Form(
        key: formKey,
        child: SizedBox(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 25,
              right: 25,
              top: 40,
            ),
            child: Center(
              child: Column(
                children: [
                  MediaQuery.of(context).viewInsets.bottom == 0
                      ? Lottie.asset('assets/images/resetPassword.json')
                      : Lottie.asset('assets/images/resetPassword.json',
                          height: 150, width: 150),
                  const SizedBox(
                    height: 40,
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
                        color: Colors.black,
                      ),
                    ),
                    suffixIcon: const Text(""),
                    hintText: 'Email',
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  GetBuilder<AuthController>(builder: (_) {
                    return AuthButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            controller.ForgetPassword(
                                emailController.text.trim());
                          }
                        },
                        text: 'Send');
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
