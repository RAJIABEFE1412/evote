import 'package:evote/component/app_text.dart';
import 'package:evote/component/buttons/app_button.dart';
import 'package:evote/component/inputs/app_sized_box.dart';
import 'package:evote/pages/dashboard/last_screen.dart';
import 'package:evote/styles/colors.dart';
import 'package:evote/styles/text_styles.dart';
import 'package:evote/utils/extensions.dart';
import 'package:flutter/material.dart';

class CandidatePanel extends StatelessWidget {
  final Map<String, dynamic> data;
  const CandidatePanel(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scaler = context.scaler;
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
      ),
      child: InkWell(
        onTap: () async {
          showBottomSheet(
            context: context,
            backgroundColor: EvoteColors.overlay,
            builder: (ctx) {
              return Container(
                height: 300,
                width: scaler.sizer.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(
                      15,
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      EvoteSizedBox(
                        height: 0.5,
                      ),
                      Align(
                          alignment: Alignment.topRight, child: CloseButton()),
                      EvoteSizedBox(
                        height: 0.5,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 75,
                              width: 75,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(200),
                                ),
                                image: DecorationImage(
                                  image: AssetImage(
                                    data["candidateImage"],
                                  ),
                                ),
                                color: Colors.green,
                              ),
                            ),
                          ),
                          EvoteSizedBox(
                            width: 2.5,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              EvoteText(
                                data["candidateName"] ?? "",
                                style: EvoteTextStyle.bold.copyWith(
                                  fontSize: 55.0,
                                ),
                              ),
                              const EvoteSizedBox(
                                height: .5,
                              ),
                              EvoteText(
                                "Presidential Candidate",
                                style: EvoteTextStyle.medium.copyWith(
                                  fontSize: 45.0,
                                ),
                              ),
                              const EvoteSizedBox(
                                height: .5,
                              ),
                              EvoteText(
                                data["candidateParty"] ?? "",
                                style: EvoteTextStyle.light.copyWith(
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      EvoteSizedBox(
                        height: 2.5,
                      ),
                      EvoteButton(
                        text: "VOTE",
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (ctx) {
                                return AlertDialog(
                                  title: EvoteText("Cast your vote?"),
                                  content: EvoteText(
                                    "Are you sure you want to vote for this candidate?This action cannot be undone",
                                  ),
                                  actions: [
                                    EvoteButton(
                                      text: "CANCEL",
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                    EvoteButton(
                                      text: "VOTE",
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (tx) => CongratScreen(),
                                            fullscreenDialog: true,
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                );
                              });
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: Card(
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 75,
                  width: 75,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(200),
                    ),
                    image: DecorationImage(
                      image: AssetImage(
                        data["candidateImage"],
                      ),
                    ),
                    color: Colors.green,
                  ),
                ),
              ),
              EvoteSizedBox(
                width: 2.5,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  EvoteText(
                    data["candidateName"] ?? "",
                    style: EvoteTextStyle.bold.copyWith(
                      fontSize: 55.0,
                    ),
                  ),
                  const EvoteSizedBox(
                    height: .5,
                  ),
                  EvoteText(
                    "Presidential Candidate",
                    style: EvoteTextStyle.medium.copyWith(
                      fontSize: 45.0,
                    ),
                  ),
                  const EvoteSizedBox(
                    height: .5,
                  ),
                  EvoteText(
                    data["candidateParty"] ?? "",
                    style: EvoteTextStyle.light.copyWith(
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
