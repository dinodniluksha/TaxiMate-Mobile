import 'package:flutter/material.dart';
import 'package:taxiapp/components/background/plain_background.dart';
import 'package:taxiapp/screens/home/components/home_tab_controller.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Background(child: HomeTabController());
  }
}
