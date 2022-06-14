import 'package:ecommerce/logic/controller/product_controller.dart';
import 'package:ecommerce/model/product_model.dart';
import 'package:ecommerce/utils/theme.dart';
import 'package:ecommerce/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class ProductInfo extends StatelessWidget {
  final ProductModel model;
  var controller = Get.find<ProductController>();

  ProductInfo({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextUtils(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                text: model.title,
                color:Get.isDarkMode?Colors.white: Colors.black,
                underLine: false,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  TextUtils(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    text: '${model.rating.rate}',
                    color: Get.isDarkMode?Colors.white:Colors.black,
                    underLine: false,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  RatingBarIndicator(
                    rating: model.rating.rate,
                    itemBuilder: (context, index) => Icon(
                      Icons.star,
                      color:Get.isDarkMode?yellowEmadClr: Colors.amber,
                    ),
                    itemCount: 5,
                    itemSize: 20.0,
                    direction: Axis.horizontal,
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 30,
        ),
        Obx(
          () => IconButton(
              onPressed: () {
                controller.addToFavorites(model.id);
              },
              icon: controller.isFavorite(model.id)
                  ? const Icon(
                      Icons.favorite,
                      size: 30,
                      color: Colors.red,
                    )
                  : Icon(
                      Icons.favorite_border_outlined,
                      size: 30,
                      color:Get.isDarkMode?Colors.white: Colors.black,
                    )),
        ),
      ],
    );
  }
}
