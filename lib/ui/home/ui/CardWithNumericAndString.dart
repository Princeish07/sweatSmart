import 'package:flutter/material.dart';

import '../../../other/app_resource/AppColors.dart';
import '../../../other/app_resource/AppStyle.dart';
class CardWithNumericAndString extends StatefulWidget {
  final bool? isCenteredAlign;
  final String? value;
  final String? placeholder;
  final IconData? imageString;
  const CardWithNumericAndString({super.key, this.isCenteredAlign,this.value,this.placeholder,this.imageString});

  @override
  State<CardWithNumericAndString> createState() => _CardWithNumericAndStringState();
}

class _CardWithNumericAndStringState extends State<CardWithNumericAndString> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 20),
          decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)),color: Color(0x1AFFFFFF)),
          child: Column(
          crossAxisAlignment: widget.isCenteredAlign==true ? CrossAxisAlignment.center   : CrossAxisAlignment.start
          ,children: [
          Text(widget.value!,style: AppStyles().largeHeadingStyle(Colors.white)),
          Row(
            mainAxisAlignment: widget.isCenteredAlign==true ? MainAxisAlignment.center   : MainAxisAlignment.start
,
            children: [
              Icon(widget.imageString,color: Colors.white,),
              Text(widget.placeholder!,style: AppStyles().greySmallFontStyle(Colors.white),),
            ],
          )

        ],)
      ),
    );
  }
}
