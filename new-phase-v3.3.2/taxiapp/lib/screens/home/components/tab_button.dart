import 'package:flutter/material.dart';
import 'package:taxiapp/components/button/round_button.dart';
import 'package:taxiapp/components/icon_box.dart';

class TabButton extends StatelessWidget {
  final double tabIndex;
  final double textSize;
  final Color textColor;
  final VoidCallback tabPress;
  final bool tabStates;
  const TabButton({
    Key? key,
    required this.tabIndex,
    this.textSize = 18,
    this.textColor = Colors.white,
    required this.tabStates,
    required this.tabPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoundButton(
      width: 150,
      height: 60,
      circularRadius: 25,
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconBox(
            iconPath: tabIndex == 0
                ? tabStates
                    ? 'assets/icons/taxi_purple.svg'
                    : 'assets/icons/taxi_black.svg'
                : tabIndex == 1
                    ? tabStates
                        ? 'assets/icons/search_purple.svg'
                        : 'assets/icons/search_black.svg'
                    : '',
            iconWidth: 40,
            iconHeight: 30,
          ),
          Text(
            tabIndex == 0
                ? 'My Taxi'
                : tabIndex == 1
                    ? 'Search Taxi'
                    : '',
            style: TextStyle(
                color: tabStates ? Colors.white : Colors.black,
                fontSize: 17,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
      color: tabStates ? Colors.indigo.shade900 : Colors.white,
      press: tabPress,
    );
  }
}
