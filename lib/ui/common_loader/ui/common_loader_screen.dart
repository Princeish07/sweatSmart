import 'package:flutter/material.dart';
class CommonLoader extends StatefulWidget {
  const CommonLoader({super.key});

  @override
  State<CommonLoader> createState() => _CommonLoaderState();
}

class _CommonLoaderState extends State<CommonLoader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.5),
      child: Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.cyan,
          color: Colors.red,
        ),
      ),
    );
  }
}
