import 'package:flutter/material.dart';
import 'package:taxiapp/components/app_bar/custom_app_bar.dart';
import 'package:taxiapp/screens/home/components/body.dart';

double? width;
double? height;
ThemeData appTheme = ThemeData(
    primaryColor: Colors.purple,
    /* Colors.tealAccent,*/
    secondaryHeaderColor: Colors.blue /* Colors.teal*/
    // fontFamily:
    );

class HomeScreen extends StatelessWidget {
  final VoidCallback backAction;
  const HomeScreen({Key? key, required this.backAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.shortestSide;
    height = MediaQuery.of(context).size.longestSide;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: CustomAppBar(
          headLeft: InkWell(
            child: Icon(Icons.arrow_back, color: Colors.black),
            onTap: backAction,
          ),
          screenName: 'Hi...Guest',
        ),
      ),
      body: Stack(
        children: [
          ClipPath(
            clipper: Clipper08(),
            child: Container(
              height: height! * .65 < 450 ? height! * .58 : 500, //400
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                appTheme.primaryColor,
                appTheme.secondaryHeaderColor
              ])),
            ),
          ),
          Container(
            alignment: Alignment.topCenter,
            child: Body(),
          ),
        ],
      ),
    );
  }
}

class Clipper08 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    path.lineTo(0.0, size.height);
    // ignore: non_constant_identifier_names
    var End = Offset(size.width / 2, size.height - 30.0);
    // ignore: non_constant_identifier_names
    var Control = Offset(size.width / 4, size.height - 50.0);

    path.quadraticBezierTo(Control.dx, Control.dy, End.dx, End.dy);
    // ignore: non_constant_identifier_names
    var End2 = Offset(size.width, size.height - 80.0);
    // ignore: non_constant_identifier_names
    var Control2 = Offset(size.width * .75, size.height - 10.0);

    path.quadraticBezierTo(Control2.dx, Control2.dy, End2.dx, End2.dy);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}
