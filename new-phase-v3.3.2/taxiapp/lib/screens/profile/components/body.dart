import 'package:flutter/material.dart';
import 'package:taxiapp/components/background/plain_background.dart';
import 'package:taxiapp/screens/inner/inner_screen.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => InnerScreen()));
              },
              child: Text(
                'Go to next screen',
                style: TextStyle(fontSize: 15),
              ),
              style: TextButton.styleFrom(
                backgroundColor: Colors.purple,
                primary: Colors.white,
              ),
            ),
            Container(
              width: 200,
              height: 200,
              color: Colors.blue,
            ),
            Container(
              width: 200,
              height: 200,
              color: Colors.red,
            ),
            Container(
              width: 200,
              height: 200,
              color: Colors.yellow,
            )
          ],
        ),
      ),
    );
  }
}
