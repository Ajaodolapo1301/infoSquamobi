
import 'package:flutter/material.dart';

import 'package:squamobi_test/core/utils/sizeConfig/size_config.dart';



class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final ButtonType type;
  final bool showArrow;
  final Color color;
  final Color textColor;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.textColor = Colors.white,
    this.type = ButtonType.filled,
    this.showArrow = false,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (type == ButtonType.outlined) {
      return SizedBox(
        width: double.maxFinite,
        child: OutlinedButton(
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(
              fontFamily: 'DMSans',
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 2.5 * SizeConfig.textMultiplier
            ),
          ),

          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(color),
            // borderSide: BorderSide(color: blue),
            padding: MaterialStateProperty.all( const EdgeInsets.symmetric(vertical: 18),),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ))

          ),

          // highlightElevation: 0,
        ),
      );
    }
    return SizedBox(
      width: double.maxFinite,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style:  TextStyle(
                color: Colors.white,
                fontFamily: 'DMSans',
                fontWeight: FontWeight.w600,
                fontSize: 2.5 * SizeConfig.textMultiplier,

              ),
            ),
            if (showArrow)
              Container(
                margin: const EdgeInsets.only(left: 10),
                child: const RotatedBox(
                  quarterTurns: 2,
                  child: Icon(
                    Icons.keyboard_backspace_rounded,
                    color: Colors.white,
                  ),
                ),
              ),
          ],
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(color ),
          padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(vertical: 18),
          ),
          elevation: MaterialStateProperty.all(0),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}

enum ButtonType { outlined, filled }
