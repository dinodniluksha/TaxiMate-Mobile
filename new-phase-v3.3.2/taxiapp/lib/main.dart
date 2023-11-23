import 'package:flutter/material.dart';
import 'package:taxiapp/screens/login/login_screen.dart';
import 'package:taxiapp/screens/main_screen/main_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:taxiapp/services/auth_service.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
      //home: MainScreen(),
      //home: LoginPage(),
      home: AuthService().handleAuthState(),
    );
  }
}
