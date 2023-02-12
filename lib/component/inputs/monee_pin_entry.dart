import 'package:evote/styles/colors.dart';
import 'package:evote/utils/typedefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:evote/utils/dimensions.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class EvotePinInput extends StatefulWidget {
  final TextEditingController? controller;
  final int length;
  final OnChanged<String>? onChanged;
  final OnChanged<String> onCompleted;
  final Color activeColor;
  final Color inactiveColor;
  final Color selectedColor;
  final Color backgroundColor;
  final bool isSpaced;
  final bool isEnabled;
  final bool autoFocus;
  final TextStyle? textStyle;
  final FocusNode? focusNode;
  final bool? moreThan4;
  final double? fieldWidth;
  const EvotePinInput({
    this.controller,
    required this.length,
    this.onChanged,
    this.isSpaced = false,
    this.isEnabled = true,
    required this.onCompleted,
    this.activeColor = EvoteColors.gray,
    this.inactiveColor = EvoteColors.grayBorder,
    this.selectedColor = EvoteColors.greenDark,
    this.backgroundColor = EvoteColors.transparent,
    this.autoFocus = false,
    this.textStyle,
    this.fieldWidth,
    this.moreThan4,
    this.focusNode,
  })  : assert(length != null),
        assert(onCompleted != null);

  @override
  State<StatefulWidget> createState() {
    return _EvotePinInputState();
  }
}

class _EvotePinInputState extends State<EvotePinInput> {
  @override
  void initState() {
    if (widget.controller != null &&
        widget.controller?.text != null &&
        (widget.controller?.text.isNotEmpty ?? false)) {
      widget.controller!.value = TextEditingValue.empty;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _style = widget.textStyle != null
        ? widget.textStyle
        : Theme.of(context).textTheme.bodyText1;
    double _fontSize = EvoteScaleUtil(context).fontSizer.sp(35.0);

    final scaler = EvoteScaleUtil(context);
    return Table(
      columnWidths: {
        0: FlexColumnWidth(widget.isSpaced ? 0.2 : 1),
        1: const FlexColumnWidth(2.2),
        2: FlexColumnWidth(widget.isSpaced ? 0.2 : 1)
      },
      children: [
        TableRow(
          children: [
            SizedBox(),
            PinCodeTextField(
              autoDisposeControllers: false, obscureText: true,
              focusNode: widget.focusNode,
              enabled: widget.isEnabled,
              keyboardType: TextInputType.number,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.circle,
                fieldWidth: widget.fieldWidth ?? 30,

                activeColor: widget.activeColor,
                selectedColor: widget.selectedColor,
                inactiveColor: widget.inactiveColor,
                // borderRadius: BorderRadius.all(
                //   Radius.circular(
                //     scaler.fontSizer.sp(
                //       6,
                //     ),
                //   ),
                // ),
              ),
              controller: widget.controller,
              // obsecureText: true,
              // fieldHeight: scaler.sizer.setHeight(6),
              // fieldWidth: scaler.sizer.setWidth(10),
              textStyle: _style!.copyWith(fontSize: _fontSize),
              autoFocus: widget.autoFocus,
              length: widget.length,
              // shape: PinCodeFieldShape.box,
              backgroundColor: widget.backgroundColor,
              // borderRadius: BorderRadius.circular(scaler.sizer.setWidth(1.5)),
              onChanged: (val) {
                if (widget.onChanged != null) {
                  widget.onChanged!(val);
                }
                if (widget.controller != null) {
                  widget.controller!.value = TextEditingValue(text: val);
                }
              },
              onCompleted: (val) {
                // FocusScope.of(context).requestFocus(FocusNode());
                if (widget.controller != null) {
                  widget.controller!.value = TextEditingValue(text: val);
                }
                if (widget.onCompleted != null) {
                  widget.onCompleted(val);
                }
              },
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],

              appContext: context,
            ),
            SizedBox(),
          ],
        )
      ],
    );
  }
}
