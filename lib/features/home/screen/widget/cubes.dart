

import 'package:flutter/material.dart';
import 'package:squamobi_test/core/constants/app_constants.dart';
import 'package:squamobi_test/core/styles/font_sizes.dart';


class Cubes extends StatelessWidget {
  final String text;
  final Color cubeColor;
  const Cubes({Key? key, required this.text, required this.cubeColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        children: [
          Container(
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: cubeColor.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: const Offset(0, 2)
                    )
                  ]
              ),
              child: Image.asset("$imagePath/dashboard.png", height: thirty, width: thirtyWidth, color: cubeColor,)),
          const SizedBox(width: 13,),
          Text(text, style:kBold500.copyWith(fontSize: sixteen, fontWeight: FontWeight.w600) ,)

        ],
      ),
    );
  }


}