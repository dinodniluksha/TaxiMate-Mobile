import 'package:flutter/material.dart';
import 'package:taximate_mobile/components/icon_box.dart';
import 'package:taximate_mobile/constant/size_config.dart';

class BottomNavItem extends StatelessWidget {
  final String itemType;
  final bool isActive;
  const BottomNavItem({
    required this.itemType,
    required this.isActive,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var path;
    switch (itemType) {
      case "Home":
        path = isActive
            ? "assets/icons/add_to_inbox_white.svg"
            : "assets/icons/add_to_inbox_black.svg";
        break;
      case "Outbox":
        path = isActive
            ? "assets/icons/outbox_white.svg"
            : "assets/icons/outbox_black.svg";
        break;
      case "Activity":
        path = isActive
            ? "assets/icons/trip_list.svg"
            : "assets/icons/trip_list.svg";
        break;
      case "Profile":
        path = isActive
            ? "assets/icons/customer_white.svg"
            : "assets/icons/customer_black.svg";
    }

    return IconBox(
        iconWidth: getProportionateScreenWidth(30),
        iconHeight: getProportionateScreenHeight(30),
        iconPath: path);
  }
}
