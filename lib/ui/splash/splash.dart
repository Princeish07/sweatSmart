import 'package:flutter/material.dart';
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(100),
      color: Colors.white,
      child:  Image.asset( "assets/images/ic_logo_gif.gif",)
    );
  }
}
