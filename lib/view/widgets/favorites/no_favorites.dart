import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NoFavorites extends StatelessWidget {
  const NoFavorites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(child:Lottie.asset('assets/images/empty.json')),
        ),
      ),
    );
  }
}
