import 'package:flutter/material.dart';
import 'package:taxiapp/components/background/plain_background.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Container(
        color: Colors.purple,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Text(
                'Inner Screen',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              margin: EdgeInsets.all(16),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Go back'),
              style: TextButton.styleFrom(
                backgroundColor: Colors.white,
                primary: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
