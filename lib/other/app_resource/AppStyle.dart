import 'dart:ui';

import 'package:flutter/material.dart';

import 'AppColors.dart';

class AppStyles{
  TextStyle profileHeadingStyle(Color color){
    return TextStyle(fontSize: 25,color: color,fontWeight: FontWeight.bold);
  }
  TextStyle largeHeadingStyle(Color color){
    return TextStyle(fontSize: 40,color: color,fontWeight: FontWeight.bold);
  }

  TextStyle largeSubHeadingStyle(Color color){
    return TextStyle(fontSize: 16,color: color,fontWeight: FontWeight.bold);
  }

  TextStyle regularFontStyle(Color color){
    return TextStyle(fontSize: 24,color: color,fontWeight: FontWeight.bold);
  }
  TextStyle greySmallFontStyle(Color color){
    return TextStyle(fontSize: 12,color:color);
  }


  TextStyle greyRegularFontStyle(Color color){
    return TextStyle(fontSize: 16,color: color);
  }


}