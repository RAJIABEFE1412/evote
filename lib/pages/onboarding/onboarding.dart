import 'package:evote/pages/onboarding/auth/login.dart';
import 'package:evote/styles/colors.dart';
import 'package:evote/styles/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';

class OnBoarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: OnBoardingSlider(
        headerBackgroundColor: Colors.white,
        finishButtonText: 'Get Started'.toUpperCase(),
        skipTextButton: Text(
          'Skip',
          style: EvoteTextStyle.medium.copyWith(
            color: EvoteColors.greenDark,
            fontSize: 19.5,
          ),
        ),
        finishButtonColor: EvoteColors.greenDark,
        controllerColor: Colors.black,
        onFinish: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (ctx) => LogIn()),
          );
        },
        // trailing: Text('Login'),
        background: const [
          SizedBox(),
          SizedBox(),
          SizedBox(),
          //   Image.asset('images/slide_1.png'),
          //   Image.asset('images/slide_2.png'),
          //   Image.asset('images/slide_3.png'),
        ],
        totalPage: 3,
        speed: 1.8,
        pageBodies: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 40,
                ),
                Image.asset('images/slide_1.png'),
                const SizedBox(
                  height: 40,
                ),
                const Text('Register',
                    style: TextStyle(
                      fontSize: 22,
                    )),
                const SizedBox(
                  height: 10,
                ),
                Text('''Register to exercise your civil rights from 
anywhere, at anytime without having 
to go through stress.''',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.5,
                    )),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 40,
                ),
                Image.asset('images/slide_2.png'),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  'Vote',
                  style: TextStyle(
                    fontSize: 22,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                    'Vote for the candidate you believe can get the job done at your own convenience anonymously',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.5,
                    )),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 40,
                ),
                Image.asset('images/slide_3.png'),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  "Monitor",
                  style: TextStyle(
                    fontSize: 22,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                    'Closely monitor the election live as it goes on, with detailed statistics and information on each poll',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.5,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
