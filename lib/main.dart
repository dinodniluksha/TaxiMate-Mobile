import 'package:flutter/material.dart';
import 'package:taximate_mobile/screens/main_screen/main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.purple,
        secondaryHeaderColor: Colors.blue,
        primarySwatch: Colors.blue,
      ),
      home: MainScreen(),
    );
  }
}
