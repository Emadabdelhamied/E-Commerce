import 'package:badges/badges.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/logic/controller/cart_controller.dart';
import 'package:ecommerce/routes/routes.dart';
import 'package:ecommerce/utils/theme.dart';
import 'color_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImageSlider extends StatefulWidget {
  final String imageUrl;
  const ImageSlider({Key? key, required this.imageUrl}) : super(key: key);
  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  List colors = [
    kCOlor1,
    kCOlor2,
    kCOlor3,
    kCOlor4,
    kCOlor5,
  ];
  CarouselController carouselController = CarouselController();
  int currentIndex = 0;
  int currentColor = 0;
  var cartController=Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            gradient: LinearGradient(begin: Alignment.topCenter, colors: [
              Get.isDarkMode?yellowEmadClr.withOpacity(0.6):mainColor.withOpacity(.6),
              Get.isDarkMode?yellowEmadClr.withOpacity(0.3):mainColor.withOpacity(.3),
            ]),
          ),
          child: Padding(
            padding: const EdgeInsets.all(35),
            child: CarouselSlider.builder(
              itemCount: 3,
              carouselController: carouselController,
              itemBuilder: (BuildContext context, int index, int realIndex) =>
                  Container(
                height: MediaQuery.of(context).size.height * 0.4,
                margin: const EdgeInsets.symmetric(horizontal: 10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: NetworkImage(widget.imageUrl),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              options: CarouselOptions(
                  height: MediaQuery.of(context).size.height * 0.4,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlay: true,
                  viewportFraction: 1,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  onPageChanged: (index, reson) {
                    setState(() {
                      currentIndex = index;
                    });
                  }),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
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
            Obx(()=>Badge(
              position: BadgePosition.topEnd(top: 0, end: 4),
              badgeContent: Text(cartController.quantity().toString()),
              animationDuration: const Duration(milliseconds: 500),
              animationType:BadgeAnimationType.scale ,
              child:IconButton(
                onPressed: () {Get.toNamed(Routes.cartScreen);},
                icon: SvgPicture.asset(
                  'assets/images/cart.svg',
                  height: 30,
                  width: 30,
                  fit: BoxFit.scaleDown,
                  color: Colors.black.withOpacity(0.6),
                ),
              ),
            ),)
          ],
        ),
        Positioned(
          bottom: 5,
          left: MediaQuery.of(context).size.width * 0.4,
          child: AnimatedSmoothIndicator(
            activeIndex: currentIndex,
            count: 3,
            effect: ExpandingDotsEffect(
                dotHeight: 10, dotWidth: 10, activeDotColor:Get.isDarkMode?yellowEmadClr: mainColor),
          ),
        ),
        Positioned(
          bottom: 35,
          right: 40,
          child: Container(
            height: 150,
            width: 50,
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
                borderRadius: BorderRadius.circular(20)),
            child: ListView.separated(
              itemBuilder: (context, index) => GestureDetector(
                onTap: (){setState(() {
                  currentColor=index;
                });},
                child: ColorPicker(
                  outerBorder: currentColor==index,
                  color: colors[index],
                ),
              ),
              separatorBuilder: (context, index) => const SizedBox(
                height: 3,
              ),
              itemCount: colors.length,
            ),
          ),
        ),
      ],
    );
  }
}
