import 'dart:async';
import 'package:evote/pages/onboarding/onboarding.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      moveToNext(context);
    });
  }

  moveToNext(ccontext) {
    Timer(
      const Duration(seconds: 3),
      () => {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (
              context,
            ) =>
                OnBoarding(),
          ),
        )
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(
        0xff008751,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(),
          Center(
            child: Text(
              "E-Vote",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24.0,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              bottom: 40.0,
            ),
            child: Text(
              "Your right to a better election",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
