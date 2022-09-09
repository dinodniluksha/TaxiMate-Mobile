import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ClickableIcon extends StatelessWidget {
  final String iconPath;
  final double iconHeight;
  final double iconWidth;
  final VoidCallback tap;
  const ClickableIcon({
    Key? key,
    required this.iconPath,
    required this.iconHeight,
    required this.iconWidth,
    required this.tap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: FittedBox(
            fit: BoxFit.contain,
            child: Container(
              height: iconHeight,
              width: iconWidth,
              child: SvgPicture.asset(iconPath),
            )),
        onTap: tap);
  }
}
