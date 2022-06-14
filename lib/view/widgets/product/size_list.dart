import 'package:ecommerce/utils/theme.dart';
import 'package:ecommerce/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SizeList extends StatefulWidget {

  const SizeList({Key? key}) : super(key: key);

  @override
  State<SizeList> createState() => _SizeListState();
}

class _SizeListState extends State<SizeList> {
  int currentIndex=0;

  final sizeList=['S','M','L','XL','XXL'];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            setState(() {
              currentIndex=index;
            });
          },
          child: Container(
            height: 40,
            width: 50,
            decoration: BoxDecoration(
              color:currentIndex==index?Get.isDarkMode?yellowEmadClr:mainColor.withOpacity(0.4): Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.black.withOpacity(0.3),
              ),
            ),
            child: Center(
              child: TextUtils(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                text: sizeList[index],
                color: Colors.black,
                underLine: false,
              ),
            ),
          ),
        ),
        separatorBuilder: (context, index) => const SizedBox(
          width: 10,
        ),
        itemCount: sizeList.length,
      ),
    );
  }
}
