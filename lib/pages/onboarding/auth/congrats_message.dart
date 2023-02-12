import 'package:evote/component/app_text.dart';
import 'package:evote/component/buttons/app_button.dart';
import 'package:evote/component/inputs/app_sized_box.dart';
import 'package:evote/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CongratsMessage extends StatelessWidget {
  const CongratsMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            EvoteSizedBox(
              height: 6,
            ),
            EvoteText(
              "Account Created",
              textAlign: TextAlign.center,
            ),
            EvoteSizedBox(
              height: 4,
            ),
            Center(
              child: SvgPicture.asset(
                "images/done.svg",
                height: 180,
                width: 180,
                // color: EvoteColors.greenDark,
              ),
            ),
            EvoteSizedBox(
              height: 5,
            ),
            EvoteText(
              "Your Account has been created, and your verification is in progress. Your PVC ID will be provided within the next 24 hours",
              textAlign: TextAlign.center,
            ),
            EvoteSizedBox(
              height: 10,
            ),
            EvoteButton(
              text: "GO TO HOMEPAGE",
              onPressed: () {},
            ),
            EvoteSizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
