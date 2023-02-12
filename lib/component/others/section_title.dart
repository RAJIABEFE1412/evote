import 'package:evote/component/app_text.dart';
import 'package:evote/styles/colors.dart';
import 'package:evote/styles/text_styles.dart';
import 'package:evote/utils/extensions.dart';
import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final bool isCenter;
  final Color? color;
  final LinearGradient? gradient;
  final double? fontSize;
  SectionTitle(this.title,
      {this.fontSize, this.gradient, this.color, this.isCenter = false});

  Color? tileColor(mode) {
    if (mode == 1) {
      return null;
    } else {
      return EvoteColors.transparent;
    }
  }

  Color textColor(mode) {
    if (mode == 1) {
      return Color(0xFF797979);
    } else {
      return EvoteColors.greyText;
    }
  }

  @override
  Widget build(BuildContext context) {
    final scaler = context.scaler;

    if (title.isEmpty) return Offstage();

    return Container(
      margin: scaler.insets.only(bottom: 1, left: 5, right: 5),
      color: tileColor(1) ?? color,
      decoration: gradient != null ? BoxDecoration(gradient: gradient) : null,
      child: EvoteText(
        title,
        style: EvoteTextStyle.bold.copyWith(
            fontSize: fontSize,
            color: textColor(
              1,
            ) //,
            ),
        textAlign: isCenter ? TextAlign.center : null,
      ),
    );
  }
}
