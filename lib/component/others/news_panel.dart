import 'dart:developer';

import 'package:evote/utils/extensions.dart';
import 'package:flutter/material.dart';

class NewsPanel extends StatelessWidget {
  final String imageUrl;
  const NewsPanel(this.imageUrl, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log("sfds -- $imageUrl");
    final scaler = context.scaler;
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
      ),
      child: Container(
        height: 120,
        width: scaler.sizer.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              imageUrl,
            ),
            fit: BoxFit.fill,
          ),
        ),
        // child: Row(
        //   children: [
        //     Padding(
        //       padding: EdgeInsets.symmetric(
        //         horizontal: 6.0,
        //         vertical: 2.0,
        //       ),
        //       child: Column(
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: [
        //           const EvoteSizedBox(
        //             height: 6.95,
        //           ),
        //           // Flexible(
        //           //   child: EvoteText(
        //           //     "INEC approves uVote for the 2023 elections",
        //           //     overflow: TextOverflow.clip,
        //           //     maxLines: 2,
        //           //     style: EvoteTextStyle.bold.copyWith(
        //           //       fontSize: 44.0,
        //           //       color: EvoteColors.white,
        //           //     ),
        //           //   ),
        //           // ),
        //           // const EvoteSizedBox(
        //           //   height: .5,
        //           // ),
        //           // Row(
        //           //   children: [
        //           //     EvoteText(
        //           //       "Nigeria Tribune",
        //           //       style: EvoteTextStyle.medium.copyWith(
        //           //         fontSize: 45.0,
        //           //         color: EvoteColors.white,
        //           //       ),
        //           //     ),
        //           //     const EvoteSizedBox(
        //           //       width: 2.5,
        //           //     ),
        //           //     EvoteText(
        //           //       "Just now",
        //           //       style: EvoteTextStyle.medium.copyWith(
        //           //         fontSize: 45.0,
        //           //         color: EvoteColors.white,
        //           //         fontStyle: FontStyle.italic,
        //           //       ),
        //           //     ),
        //           //     //
        //           //   ],
        //           // ),
        //           // const EvoteSizedBox(
        //           //   height: .1,
        //           // ),
        //         ],
        //       ),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
