import 'package:flutter/material.dart';
import 'package:taximate_mobile/constant/size_config.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.amber,
      margin: EdgeInsets.only(top: getProportionateScreenHeight(5)),
      //height: getProportionateScreenHeight(312),
      //width: getProportionateScreenWidth(275),
      child: child,
    );
  }
}
