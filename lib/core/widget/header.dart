
import 'package:flutter/material.dart';
import 'package:squamobi_test/core/styles/color_utils.dart';


class Header extends StatelessWidget {
  final String? text;
  final Color? textColor;
  final TextStyle? textStyle;
  final VoidCallback? preferredActionOnBackPressed;
  final Widget? suffix;

  const Header({
     Key? key,
    this.text,

    this.textStyle,
    this.suffix,
    this.textColor,

    this.preferredActionOnBackPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon:  const Icon(
            Icons.close,
            size: 28,
            color: kprimaryColor,
          ), onPressed: () {

        },


        )  ,




      ],
    );
  }
}
