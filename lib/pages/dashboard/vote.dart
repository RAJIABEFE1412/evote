import 'package:evote/component/app_text.dart';
import 'package:evote/component/inputs/app_sized_box.dart';
import 'package:evote/component/inputs/app_text_field.dart';
import 'package:evote/component/others/candidate_panel.dart';
import 'package:evote/component/others/vote_panel.dart';
import 'package:evote/styles/colors.dart';
import 'package:evote/styles/text_styles.dart';
import 'package:evote/utils/extensions.dart';
import 'package:evote/values/json.dart';
import 'package:flutter/material.dart';

class Vote extends StatelessWidget {
  const Vote({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scaler = context.scaler;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: EvoteText(
          "Vote",
          style: EvoteTextStyle.medium.copyWith(
            color: EvoteColors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: scaler.insets.all(8.0),
            child: Column(
              children: [
                EvoteTextField(
                  hintText: "Search",
                ),
                EvoteSizedBox(
                  height: 2.5,
                ),
                ...List.generate(
                  nationalData.length,
                  (index) => VotePanel(nationalData[index]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
