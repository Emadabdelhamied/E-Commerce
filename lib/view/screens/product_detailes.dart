import 'package:ecommerce/model/product_model.dart';
import 'package:ecommerce/utils/theme.dart';
import 'package:ecommerce/view/widgets/product/add_cart.dart';
import 'package:ecommerce/view/widgets/product/product_info.dart';
import 'package:ecommerce/view/widgets/product/size_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import '../widgets/product/image_slider.dart';
import 'package:flutter/material.dart';
class ProductDetailsScreen extends StatelessWidget {
  final ProductModel model;
  const ProductDetailsScreen({Key? key,required this.model}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ImageSlider(imageUrl: model.image,),
                const SizedBox(height: 25,),
                ProductInfo(model: model,),
                const SizedBox(height: 25,),
                ReadMoreText(
                  model.description,
                  trimLength: 100,
                  style: TextStyle(color:Get.isDarkMode?Colors.white: Colors.black,height: 1.5),
                  trimLines: 3,
                  colorClickableText: mainColor,
                  textAlign: TextAlign.justify,
                  trimCollapsedText: 'Read more',
                  trimExpandedText: ' Less',
                  lessStyle:
                  TextStyle(fontWeight: FontWeight.bold, color:Get.isDarkMode?yellowEmadClr:Colors.black),
                  moreStyle:
                  TextStyle(fontWeight: FontWeight.bold, color:Get.isDarkMode?yellowEmadClr:Colors.black),
                ),
                const SizedBox(height: 25,),
                const SizeList(),
                const SizedBox(height: 10,),
                AddCart(model: model,),
              ],
            ),
          ),
        ),
      )
    );
  }
}
