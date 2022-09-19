import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taximate_mobile/constant/size_config.dart';

class CustomAppBar extends StatelessWidget {
  final String screenName;
  final dynamic headLeft;
  final dynamic headMiddle;
  final dynamic headRight;
  const CustomAppBar({
    Key? key,
    required this.screenName,
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
      leadingWidth: getProportionateScreenWidth(55),
      leading: Transform.scale(
        scale: 1,
        child: headLeft != null ? headLeft : SizedBox(),
      ),
      title: headMiddle ? Text(screenName) : null,
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
