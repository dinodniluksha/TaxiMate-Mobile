import 'package:flutter/material.dart';

import '../../services/auth_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Google Login"),
        backgroundColor: Colors.green,
      ),
      body: Container(
        width: size.width,
        height: size.height,
        padding: EdgeInsets.only(
            left: 20,
            right: 20,
            top: size.height * 0.2,
            bottom: size.height * 0.2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Hello, \nGoogle sign in",
                style: TextStyle(fontSize: 20)),
            GestureDetector(
                onTap: () {
                  AuthService().signInWithGoogle();
                },
                child: const Image(
                    width: 50,
                    image: AssetImage('assets/images/google-sign-in.png'))),
            TextButton(
              onPressed: () {
                AuthService().signInWithGoogle();
              },
              child: Text(
                'Login',
                style: TextStyle(fontSize: 15),
              ),
              style: TextButton.styleFrom(
                backgroundColor: Colors.purple,
                primary: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
