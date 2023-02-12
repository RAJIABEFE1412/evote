// import 'package:evote/components/fragments/buttons/app_button.dart';
// import 'package:evote/components/fragments/buttons/monee_flat_button.dart';
// import 'package:evote/components/fragments/canvas/circle.dart';
// import 'package:evote/components/fragments/spacers/app_sized_box.dart';
// import 'package:evote/components/typography/app_text.dart';
// import 'package:evote/inventory_icon_icons.dart';
// import 'package:evote/style/style.dart';
// import 'package:evote/style/text_styles.dart';
// import 'package:evote/utils/extensions.dart';
// import 'package:evote/values/images.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';

// class LoanEmptyState extends StatelessWidget {
//   final Function onRetry;
//   final String message;

//   LoanEmptyState({
//     required this.onRetry,
//     this.message = "No Outsding Loan",
//   });

//   @override
//   Widget build(BuildContext context) {
//     final scaler = (context.scaler);

//     return SingleChildScrollView(
//       padding: scaler.insets.all(5),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: <Widget>[
//           EvoteSizedBox(
//             height: 10.5,
//           ),
//           CustomPaint(
//             size: Size(
//               200,
//               200,
//             ),
//             child: Icon(
//               InventoryIcon.unie926,
//               size: 45,
//               color: EvoteColors.white,
//             ),
//             painter: CirclePainter(),
//           ),
//           // Container(
//           //         height: scaler.sizer.setHeight(15),
//           //         width: scaler.sizer.setHeight(15),
//           // decoration: BoxDecoration(
//           //   color: Color(
//           //     0xFFC4C4C4,
//           //   ),
//           //   shape: BoxShape.circle,
//           //         ),
//           //         padding: scaler.insets.all(
//           //           8,
//           //         ),
//           //         child: SvgPicture.asset(
//           //           EvoteSvgs.login,
//           //           color: EvoteColors.white,
//           //         ),
//           //       ),
//           EvoteSizedBox(
//             height: 10.5,
//           ),
//           Padding(
//             padding: scaler.insets.symmetric(horizontal: 4.0),
//             child: EvoteText(
//               message,
//               textAlign: TextAlign.center,
//               style: EvoteTextStyle.medium.copyWith(
//                 fontSize: 62.0,
//                 color: EvoteColors.greyText,
//               ),
//             ),
//           ),
//           EvoteSizedBox(height: 5.5),
//           Padding(
//             padding: scaler.insets.symmetric(horizontal: 4.0),
//             child: EvoteButton(
//               isBold: true,
//               text: "REFRESH",
//               onPressed: () {},
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
