import 'package:ecommerce/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../text_utils.dart';

class BottomContainer extends StatelessWidget {
  final String text;
  final String buttonText;
  final Function() onPressed;

  const BottomContainer({
    Key? key,
    required this.text,
    required this.buttonText,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      child: Container(
        height: 130,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Get.isDarkMode ? yellowEmadClr.withOpacity(0.6) : mainColor.withOpacity(0.6),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextUtils(
              fontSize: 18,
              fontWeight: FontWeight.normal,
              text: text,
              color: Get.isDarkMode ? darkEmadClr : Colors.black,
              underLine: false,
            ),
            TextButton(
              onPressed: onPressed,
              style: TextButton.styleFrom(primary: Colors.white),
              child: TextUtils(
                fontSize: 18,
                fontWeight: FontWeight.normal,
                text: buttonText,
                color: Colors.black,
                underLine: false,
              ),
            )
          ],
        ),
      ),
      clipper:MyClipper(height: 130,width: MediaQuery.of(context).size.width),
    );
  }
}
class MyClipper extends CustomClipper<Path>{
  final height;
  final width;
  MyClipper({required this.height,this.width});
  @override
  Path getClip(Size size) {
    Path path = Path();
    final double _xScaling = size.width /width;
    final double _yScaling = size.height / height;
    path.lineTo(360 * _xScaling,79 * _yScaling);
    path.cubicTo(360 * _xScaling,79 * _yScaling,-28 * _xScaling,79 * _yScaling,-28 * _xScaling,79 * _yScaling,);
    path.cubicTo(-28 * _xScaling,79 * _yScaling,-28 * _xScaling,21.6108 * _yScaling,-28 * _xScaling,21.6108 * _yScaling,);
    path.cubicTo(-28.0001 * _xScaling,6.30699 * _yScaling,71.6945 * _xScaling,-18.211 * _yScaling,101.333 * _xScaling,21.6108 * _yScaling,);
    path.cubicTo(130.972 * _xScaling,61.4325 * _yScaling,209.667 * _xScaling,52.7662 * _yScaling,232 * _xScaling,40.2139 * _yScaling,);
    path.cubicTo(254.333 * _xScaling,27.6615 * _yScaling,272.167 * _xScaling,27.2965 * _yScaling,304.5 * _xScaling,30.9337 * _yScaling,);
    path.cubicTo(336.833 * _xScaling,34.571 * _yScaling,360 * _xScaling,21.6108 * _yScaling,360 * _xScaling,21.6108 * _yScaling,);
    path.cubicTo(360 * _xScaling,21.6108 * _yScaling,360 * _xScaling,79 * _yScaling,360 * _xScaling,79 * _yScaling,);
    path.cubicTo(360 * _xScaling,79 * _yScaling,360 * _xScaling,79 * _yScaling,360 * _xScaling,79 * _yScaling,);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }

}
