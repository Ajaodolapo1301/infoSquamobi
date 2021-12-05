

import 'package:flutter/material.dart';
import 'package:squamobi_test/core/styles/color_utils.dart';

class CircleBar extends StatelessWidget {
  bool isActive;
  CircleBar(this.isActive,{Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      margin: const EdgeInsets.symmetric(horizontal: 8),
      height: isActive ? 6 : 4,
      width: isActive ? 6 : 4,
      decoration: BoxDecoration(
        // border: Border.all(color: blue),
          color: isActive ? purple : const Color(0xffD8D8D8),
          borderRadius: const BorderRadius.all(Radius.circular(12))),
    );
  }
}
