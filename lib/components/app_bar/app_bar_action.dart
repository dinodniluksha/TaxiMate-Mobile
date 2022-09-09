import 'package:flutter/material.dart';
import 'package:taximate_mobile/components/clickable_icon.dart';
import 'package:taximate_mobile/constant/constants.dart';
import 'package:taximate_mobile/constant/size_config.dart';

class AppBarAction extends StatefulWidget {
  final String actionType;
  final String actionHint;
  final dynamic customAction;
  final dynamic navigateScreen;
  final dynamic feedContent;
  const AppBarAction({
    Key? key,
    this.actionType = AB_CLICKABLE_ICON,
    this.actionHint = '',
    this.customAction,
    this.navigateScreen,
    this.feedContent,
  }) : super(key: key);

  @override
  _AppBarActionState createState() => _AppBarActionState();
}

class _AppBarActionState extends State<AppBarAction> {
  @override
  Widget build(BuildContext context) {
    var item;
    switch (widget.actionType) {
      case AB_CLICKABLE_ICON:
        item = Container();
        switch (widget.actionHint) {
          case AB_CLOSE:
            item = ClickableIcon(
              iconHeight: getProportionateScreenHeight(28),
              iconWidth: getProportionateScreenWidth(28),
              iconPath: "assets/icons/close.svg",
              tap: () {
                Navigator.push(
                  widget.feedContent,
                  MaterialPageRoute(
                    builder: (context) => widget.navigateScreen,
                  ),
                );
              },
            );
            break;
          case AB_BACK_ON_TRANSPARENT:
            item = ClickableIcon(
              iconHeight: getProportionateScreenHeight(28),
              iconWidth: getProportionateScreenWidth(28),
              iconPath: "assets/icons/icons_arrow_long_left.svg",
              tap: () {
                print('Clicked go to back');
                Navigator.pop(widget.feedContent);
              },
            );
            break;
          case AB_BACK_ON_WHITE:
            item = ClickableIcon(
              iconHeight: getProportionateScreenHeight(28),
              iconWidth: getProportionateScreenWidth(28),
              iconPath: "assets/icons/back_button.svg",
              tap: () {
                print('Clicked go to back');
                Navigator.pop(widget.feedContent);
              },
            );
            break;
          case AB_FAVOURITE:
            item = ClickableIcon(
              iconHeight: getProportionateScreenHeight(28),
              iconWidth: getProportionateScreenWidth(28),
              iconPath: "assets/icons/add_to_favorite_button.svg",
              tap: widget.customAction,
            );
        }
        break;
      case AB_CLICKABLE_STRING:
        item = SizedBox();
        break;
      default:
        item = widget.feedContent;
    }
    return item;
  }
}
