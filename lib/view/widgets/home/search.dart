import 'package:ecommerce/logic/controller/product_controller.dart';
import 'package:ecommerce/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SearchField extends StatelessWidget {
  SearchField({Key? key}) : super(key: key);
  var controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
      builder: (_) => TextField(
        controller: controller.searchController,
        onChanged: (searchName) {
          controller.createSearchList(searchName);
        },
        style: TextStyle(color: Get.isDarkMode?darkEmadClr:Colors.black),
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          prefixIcon: SvgPicture.asset(
            'assets/images/search.svg',
            height: 10,
            width: 10,
            fit: BoxFit.scaleDown,
          ),
          suffixIcon: controller.searchController.text.isNotEmpty
              ? IconButton(
                  onPressed: () {
                    controller.clearSearchList();
                  },
                  icon: const Icon(
                    Icons.close,
                    color: Colors.black,
                  ))
              : null,
          hintText: 'Search',
          hintStyle: TextStyle(color: Get.isDarkMode?darkEmadClr:Colors.black),
          filled: true,
          fillColor: Colors.grey.shade200,
          enabledBorder: decoration(),
          focusedBorder: decoration(),
          errorBorder: decoration(),
          errorStyle: const TextStyle(color: Colors.white),
          focusedErrorBorder: decoration(),
        ),
        cursorColor: Colors.black,
      ),
    );
  }

  OutlineInputBorder decoration() => OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: Colors.grey.shade200,
        ),
      );
}
