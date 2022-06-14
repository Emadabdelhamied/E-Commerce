import 'package:ecommerce/logic/controller/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CheckedBox extends StatelessWidget {
  CheckedBox({Key? key}) : super(key: key);
  final Controller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
        builder: (_)=> InkWell(
        onTap:(){
          Controller.checkBox();
          },
        child: Column(
          children: [
            Center(
              child: Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Controller.isChecked?SvgPicture.asset('assets/images/check.svg'):const SizedBox(height: 0,),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
