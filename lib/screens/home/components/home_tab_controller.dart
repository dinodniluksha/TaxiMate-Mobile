import 'package:flutter/material.dart';
import 'package:taximate_mobile/screens/home/components/cab_controller_view.dart';
import 'package:taximate_mobile/screens/home/components/cab_search_view.dart';
import 'package:taximate_mobile/screens/home/components/tab_button.dart';

class HomeTabController extends StatefulWidget {
  const HomeTabController({Key? key}) : super(key: key);

  @override
  State<HomeTabController> createState() => _HomeTabControllerState();
}

class _HomeTabControllerState extends State<HomeTabController> {
  int tabIndex = 0;
  int tabsCount = 2;
  List<Widget> tabViewItems = [];
  List<bool> tabStates = [];
  bool isShopOnline = false;

  @override
  void initState() {
    initTabClickedStates();
    super.initState();
  }

  void initTabClickedStates() {
    for (var i = 0; i < tabsCount; i++) {
      tabStates.add(false);
    }
    tabStates[0] = true;
  }

  void updateTabClickedStates(int index) {
    for (var i = 0; i < tabsCount; i++) {
      if (i == index) {
        tabStates[i] = true;
      } else {
        tabStates[i] = false;
      }
    }
  }

  Widget createTabView(int tabIndex) {
    Widget tabView = SizedBox();
    switch (tabIndex) {
      case 0:
        tabView = CabControllerView();
        break;
      case 1:
        tabView = CabSearchView();
        break;
    }
    return tabView;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onPressBackInner,
      child: Container(
        padding: EdgeInsets.only(right: 25, left: 25, top: 0, bottom: 10),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                TabButton(
                  tabName: 'My Taxi',
                  tabStates: tabStates[0],
                  tabPress: () {
                    setTabWithView(0);
                  },
                ),
                TabButton(
                  tabName: 'Search Taxi',
                  tabStates: tabStates[1],
                  tabPress: () {
                    setTabWithView(1);
                  },
                )
              ],
            ),
            Expanded(
              child: createTabView(tabIndex),
            )
          ],
        ),
      ),
    );
  }

  void setTabWithView(int index) {
    tabViewItems.clear();
    updateTabClickedStates(index);
    setState(() {
      tabIndex = index;
    });
  }

  Future<bool> onPressBackInner() async {
    if (tabIndex != 0) {
      setTabWithView(0);
      return false;
    } else {
      return true;
    }
  }
}
