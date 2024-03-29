import 'package:flutter/material.dart';
import 'package:taxiapp/components/app_bar/custom_app_bar.dart';
import 'package:taxiapp/screens/inner/components/body.dart';

class InnerScreen extends StatelessWidget {
  const InnerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(40),
        child: CustomAppBar(
          headLeft: InkWell(
            child: Icon(Icons.arrow_back, color: Colors.black),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          screenName: 'Inner',
        ),
      ),
      body: Body(),
    );
  }
}
