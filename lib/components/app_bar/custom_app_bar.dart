import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taximate_mobile/components/icon_box.dart';
import 'package:taximate_mobile/constant/size_config.dart';

class CustomAppBar extends StatelessWidget {
  final dynamic headLeft;
  final dynamic headMiddle;
  final dynamic headRight;
  const CustomAppBar({
    Key? key,
    this.headLeft,
    this.headMiddle = true,
    this.headRight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: getProportionateScreenHeight(70),
      backgroundColor: Colors.blue,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      centerTitle: true,
      leadingWidth: getProportionateScreenWidth(95),
      leading: Transform.scale(
        scale: 1,
        child: headLeft != null ? headLeft : SizedBox(),
      ),
      title: headMiddle
          ? IconBox(
              iconHeight: getProportionateScreenHeight(28),
              iconWidth: getProportionateScreenWidth(28),
              iconPath: "assets/icons/app_logo.svg",
            )
          : null,
      actions: [
        Container(
          margin: EdgeInsets.only(right: getProportionateScreenWidth(35)),
          child: Transform.scale(
            scale: 1,
            child: headRight != null ? headRight : SizedBox(),
          ),
        )
      ],
    );
  }
}
