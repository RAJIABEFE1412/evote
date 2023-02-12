import 'package:evote/component/typography/button_text.dart';
import 'package:evote/styles/colors.dart';
import 'package:evote/utils/dimensions.dart';
import 'package:evote/utils/typedefs.dart';
import 'package:flutter/material.dart';

class EvoteFlatButton extends StatelessWidget {
  final OnPressed onPressed;
  final Color color;
  final Color textColor;
  final String? text;
  final Widget? child;
  final double padding;

  EvoteFlatButton(
      {this.text,
      this.child,
      required this.onPressed,
      this.color = EvoteColors.purpleLight,
      this.textColor = EvoteColors.white,
      this.padding = 2.3}) {
    if (text != null && child != null) {
      throw "Only provide one of text or child";
    }
  }

  @override
  Widget build(BuildContext context) {
    final scaler = EvoteScaleUtil(context);

    return FlatButton(
      color: EvoteColors.transparent,
      padding: scaler.insets.symmetric(vertical: padding, horizontal: 2),
      child: child != null
          ? child!
          : ButtonText(
              text!,
              textColor: textColor,
            ),
      onPressed: onPressed,
    );
  }
}
