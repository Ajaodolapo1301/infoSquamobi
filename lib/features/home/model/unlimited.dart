

import 'package:flutter/material.dart';
import 'package:squamobi_test/core/styles/color_utils.dart';

class UnLimitedModel{
  Color color;
  String text;

  UnLimitedModel({required this.color, required this.text});


  static   final List<UnLimitedModel> allText =[
    UnLimitedModel(
      color: green,
      text: "Unlimited access to all categories",
    ),
    UnLimitedModel(
      color: orange,
      text: "Unlimited access to all categories",
    ),

    UnLimitedModel(
      color: blue,
      text: "Unlimited access to all categories",
    ),
  ];
}