import 'package:evote/component/app_text.dart';
import 'package:evote/component/inputs/app_sized_box.dart';
import 'package:evote/component/inputs/app_text_field.dart';
import 'package:evote/component/others/bar.dart';
import 'package:evote/component/others/candidate_panel.dart';
import 'package:evote/component/others/vote_panel.dart';
import 'package:evote/styles/colors.dart';
import 'package:evote/styles/text_styles.dart';
import 'package:evote/utils/extensions.dart';
import 'package:evote/values/json.dart';
import 'package:flutter/material.dart';

class VoteDetails extends StatefulWidget {
  const VoteDetails({Key? key}) : super(key: key);

  @override
  State<VoteDetails> createState() => _VoteDetailsState();
}

class _VoteDetailsState extends State<VoteDetails>
    with SingleTickerProviderStateMixin {
  late final TabController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TabController(
      length: 2,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final scaler = context.scaler;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: EvoteColors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        elevation: 0.0,
        title: EvoteText(
          "Presidential",
          style: EvoteTextStyle.medium.copyWith(
            color: EvoteColors.black,
          ),
        ),
        bottom: TabBar(
          controller: _controller,
          labelColor: EvoteColors.greenDark,
          indicatorColor: EvoteColors.greenDark,
          tabs: [
            Tab(
              text: "VOTES",
            ),
            Tab(
              text: "Statistics".toUpperCase(),
            ),
          ],
        ),
      ),
      body: TabBarView(
        children: [
          SingleChildScrollView(
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
                      presidentData.length,
                      (index) => CandidatePanel(
                        presidentData[index],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          PieChartSample(),
        ],
        controller: _controller,
      ),
    );
  }
}
