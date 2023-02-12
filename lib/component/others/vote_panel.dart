import 'package:evote/component/app_text.dart';
import 'package:evote/component/inputs/app_sized_box.dart';
import 'package:evote/pages/vote/Vote_detail.dart';
import 'package:evote/styles/colors.dart';
import 'package:evote/styles/text_styles.dart';
import 'package:evote/utils/extensions.dart';
import 'package:face_pile/face_pile.dart';
import 'package:flutter/material.dart';

class VotePanel extends StatelessWidget {
  final Map<String, dynamic> data;
  const VotePanel(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scaler = context.scaler;
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 12.0,
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => VoteDetails(),
            ),
          );
        },
        child: Container(
          width: scaler.sizer.width,
          decoration: BoxDecoration(
            border: Border.all(
              color: EvoteColors.greenDark,
              width: 1,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(
                10.0,
              ),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      EvoteText(
                        data["title"],
                        style: EvoteTextStyle.bold.copyWith(
                          color: EvoteColors.black,
                          fontSize: 55.0,
                        ),
                      ),
                      const EvoteSizedBox(
                        height: 0.5,
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Candidates:",
                              style: EvoteTextStyle.medium.copyWith(
                                color: EvoteColors.black,
                              ),
                            ),
                            TextSpan(
                              text: " ${data['number_of_canditates']}",
                              style: EvoteTextStyle.medium.copyWith(
                                color: EvoteColors.black,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const EvoteSizedBox(
                        height: 0.5,
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Parties:",
                              style: EvoteTextStyle.medium.copyWith(
                                color: EvoteColors.black,
                              ),
                            ),
                            TextSpan(
                              text: " ${data['number_of_parties']}",
                              style: EvoteTextStyle.medium.copyWith(
                                color: EvoteColors.black,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        ),
                      ),
                      EvoteSizedBox(
                        height: 2.5,
                      ),
                      FacePile(
                        radius: 18,
                        space: 25,
                        images: (data["candidateImages"] as List)
                            .map(
                              (e) => AssetImage(e),
                            )
                            .toList(),
                        backgroundColor: Colors.grey.withAlpha(150),
                        childBackgroundColor: Colors.blue,
                        border: Border.all(color: Colors.white70, width: 3),
                        // child: Center(child: const Text("3+")),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(
                  12.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    EvoteText(
                      "ongoing",
                    ),
                    EvoteSizedBox(
                      height: 1.5,
                    ),
                    Icon(
                      Icons.thumb_up_alt_outlined,
                    ),
                    EvoteSizedBox(
                      height: 1.5,
                    ),
                    EvoteText(
                      "vote",
                    ),
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
