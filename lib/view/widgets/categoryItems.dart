import 'package:ecommerce/logic/controller/cart_controller.dart';
import 'package:ecommerce/logic/controller/category_controller.dart';
import 'package:ecommerce/logic/controller/product_controller.dart';
import 'package:ecommerce/utils/theme.dart';
import 'package:ecommerce/view/screens/product_detailes.dart';
import 'package:ecommerce/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class CategoryItem extends StatelessWidget {
  CategoryItem({Key? key,required this.title}) : super(key: key);
  final categorycontroller = Get.find<CategoryController>();
  final controller = Get.find<ProductController>();
  var cartController = Get.find<CartController>();
  final title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: Center(
          child: IconButton(
            icon: SvgPicture.asset(
              'assets/images/back-arrow.svg',
              fit: BoxFit.scaleDown,
              height: 30,
              width: 30,
            ),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        title: TextUtils(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          text: '$title',
          color:Get.isDarkMode?darkEmadClr: Colors.white,
          underLine: false,
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, colors: [
              Get.isDarkMode?yellowEmadClr.withOpacity(0.6):mainColor.withOpacity(.6),
              Get.isDarkMode?yellowEmadClr.withOpacity(0.6):mainColor.withOpacity(.3),
            ]),
          ),
        ),
        elevation: 0,
      ),
      body:Obx((){
        if(categorycontroller.isAllCategory.value){
          return shimmerLoading();
        }else{
          return Padding(
            padding: const EdgeInsets.only(top: 20.0,left: 20,right: 20),
            child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: categorycontroller.allCategoryList.length,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  childAspectRatio: 1,
                  mainAxisSpacing: 9.0,
                  crossAxisSpacing: 9.0,
                  maxCrossAxisExtent: 200,
                ),
                itemBuilder: (context, index) {
                  return card(
                      model: categorycontroller.allCategoryList[index],
                      onTap: () {
                        Get.to(() => ProductDetailsScreen(
                          model: categorycontroller.allCategoryList[index],
                        ));
                      });
                }),
          );
        }
      }),
    );
  }
  Widget shimmerLoading()=>Padding(
    padding: const EdgeInsets.only(top: 20.0,left: 20,right: 20),
    child: Shimmer(
      gradient: LinearGradient(
          colors: [
            Colors.black.withOpacity(0.9),
            Colors.black.withOpacity(0.3),
          ],
          begin: Alignment.centerLeft
      ),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            childAspectRatio: 1,
            crossAxisSpacing: 9.0,
            mainAxisSpacing: 9.0,
            maxCrossAxisExtent: 200),
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.4),
              borderRadius: BorderRadius.circular(20),
            ),
          );
        },
        itemCount: 6,
      ),
    ),
  );
  Widget card({required var model, required Function() onTap}) => Stack(
        alignment: Alignment.bottomCenter,
        children: [
          InkWell(
            onTap: onTap,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: NetworkImage(model.image), fit: BoxFit.fill)),
              child: Transform.translate(
                offset: const Offset(50, -50),
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 60, vertical: 61),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color:Get.isDarkMode?yellowEmadClr.withOpacity(0.6): mainColor.withOpacity(0.6)),
                  child: Center(
                    child: IconButton(
                      onPressed: () {
                        cartController.addProductToCart(model);
                      },
                      icon: SvgPicture.asset(
                        'assets/images/addcart.svg',
                        height: 30,
                        width: 30,
                        fit: BoxFit.cover,
                        color: Colors.black.withOpacity(0.6),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
              color: Colors.black.withOpacity(0.6),
            ),
            height: 25,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextUtils(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    text: '${model.price} \$',
                    color:Get.isDarkMode?yellowEmadClr.withOpacity(0.6): mainColor,
                    underLine: false,
                  ),
                  Container(
                    height: 15,
                    width: 40,
                    decoration: BoxDecoration(
                        color:Get.isDarkMode?yellowEmadClr.withOpacity(0.6): mainColor,
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 3.0, right: 1.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextUtils(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            text: '${model.rating.rate}',
                            color: Colors.white,
                            underLine: false,
                          ),
                          const Icon(
                            Icons.star,
                            color: Colors.white,
                            size: 12,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: const Offset(-50, -50),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 60, vertical: 61),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Get.isDarkMode?yellowEmadClr.withOpacity(0.6):mainColor.withOpacity(0.6)),
              child: Obx(() {
                return Center(
                  child: IconButton(
                      onPressed: () {
                        controller.addToFavorites(model.id);
                      },
                      icon: controller.isFavorite(model.id)
                          ? const Icon(
                              Icons.favorite,
                              size: 20,
                              color: Colors.red,
                            )
                          : const Icon(
                              Icons.favorite_border_outlined,
                              size: 20,
                              color: Colors.black,
                            )),
                );
              }),
            ),
          ),
        ],
      );
}
