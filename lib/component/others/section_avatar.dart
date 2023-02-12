import 'package:evote/inventory_icon_icons.dart';
import 'package:evote/styles/colors.dart';
import 'package:evote/styles/text_styles.dart';
import 'package:evote/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

import '../app_text.dart';

class SectionAvatar extends StatelessWidget {
  final String? icon;
  final bool isText;
  final bool notCircle;
  final Color iconColor;
  final bool isSvg;
  final Color? backgroundColor;

  SectionAvatar(
      {this.icon,
      this.backgroundColor,
      this.notCircle = true,
      this.isSvg = true,
      this.isText = false,
      this.iconColor = EvoteColors.white});

  // Color get backgroundColorElse {
  //   if (iconColor == EvoteColors.white || iconColor == null)
  //     return EvoteColors.velvet;
  //   return iconColor.withOpacity(.1);
  // }

  Color? backgroundColorElse() {
    return EvoteColors.greenDark;
  }

  @override
  Widget build(BuildContext context) {
    final scaler = context.scaler;

    return Container(
      constraints: BoxConstraints.tightFor(
        height: scaler.sizer.setHeight(5),
        width: scaler.sizer.setHeight(5),
      ),
      decoration: BoxDecoration(
          color: backgroundColorElse()?.withOpacity(0.1) ?? backgroundColor,
          shape: isText && (!notCircle) ? BoxShape.circle : BoxShape.rectangle,
          borderRadius: isText
              ? null
              : BorderRadius.all(Radius.circular(
                  scaler.sizer.setWidth(
                    1.0,
                  ),
                ))),
      padding: scaler.insets.all(1),
      child: Center(
        child: isText
            ? EvoteText(
                icon ?? "",
                style: EvoteTextStyle.medium.copyWith(
                  fontSize: 50.5,
                  color: backgroundColorElse(),
                ),
              )
            : isSvg
                ? Icon(
                    InventoryIcon.stringIcons[icon ?? ""],
                    color: backgroundColorElse(),
                  )
                : Image.asset(
                    icon ?? "",
                    color: backgroundColorElse(),
                  ),
      ),
    );
  }
}
