import 'package:flutter/material.dart';
import 'package:taximate_mobile/constant/constants.dart';
import 'package:taximate_mobile/constant/size_config.dart';

class RoundButton extends StatelessWidget {
  final Widget content;
  final VoidCallback press;
  final Color color;
  final double padVertical;
  final double padHorizontal;
  final fullWidth;
  final double width, height, circularRadius;
  const RoundButton({
    Key? key,
    required this.content,
    required this.press,
    this.color = gPrimaryColor,
    this.padVertical = 10,
    this.padHorizontal = 10,
    this.fullWidth = false,
    this.width = 300,
    this.height = 56,
    this.circularRadius = 10,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(10)),
      width: fullWidth ? double.infinity : getProportionateScreenWidth(width),
      height: getProportionateScreenHeight(height),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(circularRadius),
        child: TextButton(
          style: TextButton.styleFrom(
              primary: gPrimaryColor,
              padding: EdgeInsets.symmetric(
                  vertical: padVertical, horizontal: padHorizontal),
              backgroundColor: color),
          onPressed: press,
          child: content,
        ),
      ),
    );
  }
}
