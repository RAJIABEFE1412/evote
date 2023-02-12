// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:pin_code_fields/pin_code_fields.dart';
// import 'package:evote/style/colors.dart';
// import 'package:evote/style/text_styles.dart';
// import 'package:evote/utils/extensions.dart';
// import 'package:evote/utils/typedefs.dart';

// class EvotePinInput extends StatefulWidget {
//   final TextEditingController controller;
//   final OnChanged<String> onChanged;
//   final OnChanged<String> onCompleted;
//   final bool autoFocus;
//   final TextStyle textStyle;

//   EvotePinInput({
//     this.controller,
//     this.onChanged,
//     required this.onCompleted,
//     this.autoFocus = true,
//     this.textStyle,
//   }) : assert(onCompleted != null);

//   @override
//   State<StatefulWidget> createState() {
//     return _EvotePinInputState();
//   }
// }

// class _EvotePinInputState extends State<EvotePinInput> {
//   FocusNode _primaryFocus = FocusNode();
//   TextEditingController _ctrl;

//   @override
//   void initState() {
//     if (widget.controller != null &&
//         widget.controller.text != null &&
//         widget.controller.text.isNotEmpty) {
//       widget.controller.value = TextEditingValue.empty;
//     }
//     _ctrl = TextEditingController();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final scaler = context.scaler;

//     return Table(
//       defaultVerticalAlignment: TableCellVerticalAlignment.middle,
//       columnWidths: {
//         0: FlexColumnWidth(.5),
//         1: FlexColumnWidth(9),
//         2: FlexColumnWidth(.5),
//       },
//       children: [
//         TableRow(
//           children: [
//             SizedBox(),
//             PinCodeTextField(
//               autoDisposeControllers: false,
//               focusNode: _primaryFocus,
//               obsecureText: false,
//               controller: _ctrl,
//               textStyle: EvoteTextStyle.bold.copyWith(
//                 fontSize: scaler.fontSizer.sp(80),
//               ),
//               autoFocus: widget.autoFocus,
//               length: 6,
//               borderWidth: scaler.sizer.setHeight(.1),
//               activeColor: EvoteColors.transparent,
//               selectedColor: EvoteColors.black,
//               inactiveColor: EvoteColors.black.withOpacity(.4),
//               shape: PinCodeFieldShape.underline,
//               backgroundColor: EvoteColors.white,
//               borderRadius: BorderRadius.zero,
//               onChanged: (val) {
//                 if (widget.onChanged != null) {
//                   widget.onChanged(val);
//                 }
//                 if (widget.controller != null) {
//                   widget.controller.text = val;
//                 }
//               },
//               onCompleted: (val) {
//                 FocusScope.of(context).requestFocus(FocusNode());
//                 if (widget.controller != null) {
//                   widget.controller.text = val;
//                 }
//                 if (widget.onCompleted != null) {
//                   widget.onCompleted(val);
//                 }
//               },
//               inputFormatters: [FilteringTextInputFormatter.digitsOnly],
//               textInputType: TextInputType.number,
//             ),
//             SizedBox(),
//           ],
//         )
//       ],
//     );
//   }
// }
