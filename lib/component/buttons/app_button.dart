import 'package:evote/component/inputs/app_sized_box.dart';
import 'package:evote/component/typography/button_text.dart';
import 'package:evote/styles/colors.dart';
import 'package:evote/styles/text_styles.dart';
import 'package:evote/utils/dimensions.dart';
import 'package:evote/utils/typedefs.dart';
import 'package:flutter/material.dart';

class EvoteButton extends StatelessWidget {
  final OnPressed? onPressed;
  final Color? color;
  final Color? disabledColor;
  final Color textColor;
  final Color secondTextColor;
  final String text;
  final String? secondText;
  final bool? isDense;
  final bool isFitted;
  final bool isBold;
  final bool? fontItalize;
  final double? verticalPadding;
  final double? horizontalPadding;
  final double fontSize;
  final double cornerRadius;
  final bool? _rich;
  final bool? _icon;
  final IconData? icon;

  EvoteButton({
    required this.text,
    required this.onPressed,
    this.color = EvoteColors.greenDark,
    this.textColor = EvoteColors.white,
    this.disabledColor,
    this.isDense = true,
    this.isBold = false,
    this.isFitted = true,
    this.secondTextColor = EvoteColors.black,
    this.verticalPadding,
    this.fontItalize,
    this.horizontalPadding,
    this.fontSize = 40,
    this.cornerRadius = 15,
    Key? key,
  })  : this.secondText = null,
        this._rich = false,
        this._icon = false,
        this.icon = null,
        super(key: key);

  EvoteButton.icon({
    required this.text,
    required this.onPressed,
    this.color = EvoteColors.orange,
    this.textColor = EvoteColors.white,
    this.disabledColor,
    this.isDense = true,
    this.isBold = false,
    this.isFitted = true,
    this.secondTextColor = EvoteColors.black,
    this.verticalPadding,
    required this.icon,
    this.fontItalize,
    this.horizontalPadding,
    this.fontSize = 40,
    this.cornerRadius = 15,
    Key? key,
  })  : this.secondText = null,
        this._rich = false,
        this._icon = true,
        super(key: key);

  EvoteButton.rich({
    required this.text,
    required this.onPressed,
    required this.secondText,
    this.color = EvoteColors.purple,
    this.textColor = EvoteColors.white,
    this.secondTextColor = EvoteColors.black,
    this.disabledColor,
    this.isDense = true,
    this.isBold = false,
    this.isFitted = true,
    this.fontItalize,
    this.verticalPadding,
    this.horizontalPadding,
    this.fontSize = 40,
    this.cornerRadius = 30,
    Key? key,
  })  : this._rich = true,
        this.icon = null,
        this._icon = false,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final scaler = EvoteScaleUtil(context);
    return FlatButton(
      disabledColor: disabledColor ?? color!.withOpacity(.5),
      padding: scaler.insets.symmetric(
        vertical: verticalPadding ?? ((isDense ?? false) ? 2 : 2.5),
        horizontal: horizontalPadding ?? 8,
      ),
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          scaler.fontSizer.sp(cornerRadius),
        ),
      ),
      child: this._icon ?? false
          ? Column(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: EvoteColors.gray,
                  child: Icon(
                    icon,
                    color: EvoteColors.black,
                  ),
                ),
                EvoteSizedBox(
                  height: 1.5,
                ),
                ButtonText(
                  text,
                  textColor:
                      onPressed != null ? textColor : textColor.withOpacity(.4),
                  fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
                  fontSize: fontSize,
                  fitted: isFitted,
                ),
              ],
            )
          : this._rich ?? false
              ? RichText(
                  text: TextSpan(
                    text: "$text ",
                    children: [
                      TextSpan(
                        text: "$secondText",
                        style: EvoteTextStyle.medium.copyWith(
                          fontSize: scaler.fontSizer.sp(40.0),
                          color: secondTextColor,
                        ),
                      ),
                    ],
                    style: EvoteTextStyle.medium.copyWith(
                      fontSize: scaler.fontSizer.sp(40.0),
                      color: textColor,
                    ),
                  ),
                )
              : ButtonText(
                  text,
                  textColor:
                      onPressed != null ? textColor : textColor.withOpacity(.4),
                  fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
                  fontSize: fontSize,
                  fitted: isFitted,
                ),
      onPressed: onPressed != null
          ? () {
              FocusScope.of(context).requestFocus(
                new FocusNode(),
              );
              onPressed!();
            }
          : null,
    );
  }
}
