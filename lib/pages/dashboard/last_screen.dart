import 'package:evote/component/app_text.dart';
import 'package:evote/component/buttons/app_button.dart';
import 'package:evote/component/inputs/app_sized_box.dart';
import 'package:evote/styles/colors.dart';
import 'package:evote/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CongratScreen extends StatelessWidget {
  const CongratScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: EvoteColors.greenDark,
      appBar: AppBar(
        backgroundColor: EvoteColors.greenDark,
        elevation: 0.0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.email,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(
          16.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: SvgPicture.asset(
                "images/done.svg",
                height: 180,
                width: 180,
                color: EvoteColors.white,
              ),
            ),
            const EvoteSizedBox(
              height: 3.5,
            ),
            EvoteText(
              "Vote Submitted",
              textAlign: TextAlign.center,
              style: EvoteTextStyle.bold.copyWith(
                color: EvoteColors.white,
                fontSize: 65.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            const EvoteSizedBox(
              height: 2.5,
            ),
            EvoteText(
              "Thank you for participating in this election. Your vote has been successfully submitted.",
              textAlign: TextAlign.center,
              style: EvoteTextStyle.bold.copyWith(
                color: EvoteColors.white,
                fontSize: 50.0,
                fontWeight: FontWeight.w200,
              ),
            ),
            const EvoteSizedBox(
              height: 2.5,
            ),
            EvoteButton(
              text: "view statistics".toUpperCase(),
              onPressed: () {},
            ),
            const EvoteSizedBox(
              height: 2.5,
            ),
            EvoteButton(
              text: "back to homepage".toUpperCase(),
              onPressed: () {},
              isBold: true,
              color: EvoteColors.white,
              textColor: EvoteColors.greenDark,
            ),
            const EvoteSizedBox(
              height: 10.5,
            ),
          ],
        ),
      ),
    );
  }
}
