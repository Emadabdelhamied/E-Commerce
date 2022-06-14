import 'package:ecommerce/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class AuthTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final Function validator;
  final Widget prefixIcon;
  final Widget suffixIcon;
  final String hintText;
  bool obscureText;

  AuthTextFormField({
    Key? key,
    required this.controller,
    this.obscureText = false,
    required this.keyboardType,
    required this.validator,
    required this.prefixIcon,
    required this.suffixIcon,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(10),
      color: errorClr,
      child: TextFormField(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus &&
                currentFocus.focusedChild != null) {
              currentFocus.focusedChild?.unfocus();
            }
          },
          style: TextStyle(color: Get.isDarkMode?darkEmadClr:Colors.black),
          controller: controller,
          obscureText: obscureText,
          cursorColor: Colors.black,
          keyboardType: keyboardType,
          validator: (value) => validator(value),
          decoration: InputDecoration(
            fillColor: Colors.grey.shade200,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            hintText: hintText,
            hintStyle: const TextStyle(
                color: Colors.black45,
                fontSize: 16,
                fontWeight: FontWeight.w500),
            filled: true,
            enabledBorder: decoration(),
            focusedBorder: decoration(),
            errorBorder: decoration(),
            errorStyle: const TextStyle(color: Colors.white),
            focusedErrorBorder: decoration(),
          )),
    );
  }
}

OutlineInputBorder decoration() => OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: Colors.grey.shade200,
      ),
    );
