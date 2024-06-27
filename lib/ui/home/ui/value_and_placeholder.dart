import 'package:flutter/material.dart';

import '../../../other/app_resource/AppStyle.dart';
class ValueAndPlaceHolder extends StatefulWidget {
  final bool isCenterAlign;
final String value;
final String placeHolder;
   ValueAndPlaceHolder({super.key,required this.isCenterAlign,required this.value,required this.placeHolder });

  @override
  State<ValueAndPlaceHolder> createState() => _ValueAndPlaceHolderState();
}

class _ValueAndPlaceHolderState extends State<ValueAndPlaceHolder> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: widget.isCenterAlign ? CrossAxisAlignment.center   : CrossAxisAlignment.start
      ,children: [
      Text(widget.value,style: AppStyles().regularFontStyle(Colors.white)),
      Text(widget.placeHolder,style: AppStyles().greySmallFontStyle(Colors.white))

    ],);;
  }
}
