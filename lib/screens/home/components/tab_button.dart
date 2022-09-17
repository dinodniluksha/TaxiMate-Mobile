import 'package:flutter/material.dart';
import 'package:taximate_mobile/components/button/round_button.dart';
import 'package:taximate_mobile/components/icon_box.dart';

class TabButton extends StatelessWidget {
  final String tabName;
  final double textSize;
  final Color textColor;
  final VoidCallback tabPress;
  final bool tabStates;
  const TabButton({
    Key? key,
    required this.tabName,
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
          // IconBox(
          //   iconPath: "assets/icons/taxi.svg",
          //   iconWidth: 30,
          //   iconHeight: 20,
          // ),
          IconBox(
            iconPath: "assets/icons/taxi_purple.svg",
            iconWidth: 40,
            iconHeight: 30,
          ),
          Text(
            tabName,
            style: TextStyle(
                color: tabStates ? Colors.white : Colors.indigo.shade900,
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
