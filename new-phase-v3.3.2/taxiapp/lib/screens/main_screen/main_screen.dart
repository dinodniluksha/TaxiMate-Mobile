import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taxiapp/constant/constants.dart';
import 'package:taxiapp/constant/size_config.dart';
import 'package:taxiapp/screens/trips/trips_screen.dart';
import 'package:taxiapp/screens/news/news_screen.dart';
import 'package:taxiapp/screens/home/home_screen.dart';
import 'package:taxiapp/screens/profile/profile_screen.dart';
import 'dart:io';

class MainScreen extends StatefulWidget {
  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;

  List<GlobalKey<NavigatorState>> _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(
        context); // initialize height and width of screen on running device
    return WillPopScope(
      onWillPop: onPressBack,
      child: Scaffold(
          backgroundColor: gWhite,
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: selectedIndex,
            unselectedItemColor: Colors.black,
            selectedItemColor: Colors.purple,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.fact_check,
                ),
                label: 'Trips',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.notifications,
                ),
                label: 'News',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
            onTap: (index) {
              setNavKeys(index);
              setState(() {
                selectedIndex = index;
              });
            },
          ),
          body: Stack(
            children: [
              _buildOffstageNavigator(0),
              _buildOffstageNavigator(1),
              _buildOffstageNavigator(2),
              _buildOffstageNavigator(3),
            ],
          )),
    );
  }

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context, int index) {
    return {
      '/': (context) {
        return [
          HomeScreen(backAction: setHome),
          TripsScreen(backAction: setHome),
          NewsScreen(backAction: exitApp),
          ProfileScreen(backAction: setHome),
        ].elementAt(index);
      },
    };
  }

  Widget _buildOffstageNavigator(int index) {
    var routeBuilders = _routeBuilders(context, index);

    return Offstage(
      offstage: selectedIndex != index,
      child: Navigator(
        key: _navigatorKeys[index],
        onGenerateRoute: (routeSettings) {
          return MaterialPageRoute(
            builder: (context) => routeBuilders[routeSettings.name]!(context),
          );
        },
      ),
    );
  }

  Future<bool> onPressBack() async {
    var isFirstRouteInCurrentTab =
        !await _navigatorKeys[selectedIndex].currentState!.maybePop();
    if (isFirstRouteInCurrentTab && (selectedIndex != 0)) {
      isFirstRouteInCurrentTab = false;
      setHome();
    }
    // let system handle back button if we're on the first route
    return isFirstRouteInCurrentTab;
  }

  void setNavKeys(int index) {
    for (int i = 0; i < 4; i++) {
      if (i != index) {
        _navigatorKeys[i] = GlobalKey<NavigatorState>();
      }
    }
  }

  void setHome() {
    setState(() {
      selectedIndex = 0;
    });
  }

  void exitApp() {
    if (Platform.isIOS) {
      exit(0);
    } else {
      SystemNavigator.pop();
    }
  }
}
