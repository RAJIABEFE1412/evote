import 'package:evote/component/app_text.dart';
import 'package:evote/component/inputs/app_sized_box.dart';
import 'package:evote/component/others/section_avatar.dart';
import 'package:evote/inventory_icon_icons.dart';
import 'package:evote/models/podos/profile_models.dart';
import 'package:evote/styles/colors.dart';
import 'package:evote/styles/text_styles.dart';
import 'package:evote/utils/extensions.dart';
import 'package:evote/utils/helpers.dart';
import 'package:evote/utils/typedefs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class SectionTile extends StatefulWidget {
  final ProfileSectionTileModel tile;
  final bool isFirst;
  final bool isChecker;
  final Widget? child;
  final OnPressed? onTap;
  SectionTile(
    this.tile, {
    this.child,
    this.isFirst = false,
    this.isChecker = false,
    this.onTap,
  });

  @override
  State<SectionTile> createState() => _SectionTileState();
}

class _SectionTileState extends State<SectionTile> {
  Color? backgroundColorElse(int index) {
    return EvoteColors.greenDark;
  }

  late ValueNotifier<bool> accepted;
  @override
  void initState() {
    super.initState();

    accepted = ValueNotifier(widget.tile.isActive ?? false);
  }

  Color tileColor(mode) {
    if (mode == 1) {
      return EvoteColors.white;
    } else {
      return EvoteColors.blackBg;
    }
  }

  Color textColor(mode) {
    if (mode == 1) {
      return EvoteColors.black;
    } else {
      return EvoteColors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    final scaler = context.scaler;

    return InkWell(
      onTap: ((widget.tile.showTrailing ?? false) &&
              widget.tile.trailingType == TrailingType.Switch)
          ? () {
              accepted.value = !accepted.value;
              widget.onTap!();
            }
          : widget.onTap,
      child: Container(
        padding: scaler.insets.symmetric(
          horizontal: 5,
          // vertical: 0.05,
        ),
        decoration: BoxDecoration(
          color: tileColor(1),
          border: null,
        ),
        child: Column(
          children: [
            if (!widget.isFirst) Divider(),
            if (!widget.isFirst)
              EvoteSizedBox(
                height: 0.25,
              ),
            Row(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: SectionAvatar(
                    icon: widget.tile.icon,
                    notCircle: widget.tile.notCircle ?? true,
                    isSvg: widget.tile.isSvg ?? true,
                    isText: widget.tile.isText ?? false,
                    backgroundColor: widget.tile.backgroundColor,
                    iconColor: widget.tile.iconColor ?? EvoteColors.primary,
                  ),
                ),
                const EvoteSizedBox(width: 4.5),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: EvoteText(
                        widget.tile.title ?? "",
                        overflow: TextOverflow.ellipsis,
                        style: EvoteTextStyle.medium.copyWith(
                          // color: backgroundColorElse(theme) ??
                          color: textColor(1), //EvoteColors.black,
                          // fontWeight: FontWeight.w600,

                          fontSize: 42.5,
                        ),
                      ),
                    ),
                    if (widget.tile.description != null)
                      EvoteSizedBox(height: .5),
                    if (widget.tile.description != null)
                      EvoteText(
                        widget.tile.description ?? "",
                        overflow: TextOverflow.ellipsis,
                        style: widget.tile.isDescriptionBold!
                            ? EvoteTextStyle.bold
                            : EvoteTextStyle.light.copyWith(
                                color: EvoteColors.black.withOpacity(.4),
                              ),
                      ),
                  ],
                ),
                if (widget.tile.showTrailing ?? false) const Spacer(),
                if ((widget.tile.showTrailing ?? false) &&
                    widget.tile.trailingType == TrailingType.Switch)
                  ValueListenableBuilder<bool>(
                    valueListenable: accepted,
                    builder: (context, value, __) => Switch.adaptive(
                      value: value,
                      activeColor: EvoteColors.green,
                      onChanged: (value) {
                        accepted.value = value;
                        widget.onTap!();
                      },
                    ),
                  ),
                if ((widget.tile.showTrailing ?? false) &&
                    widget.tile.trailingType == TrailingType.WidgetSelect)
                  widget.child!,
                if ((widget.tile.showTrailing ?? false) &&
                    widget.tile.trailingType == TrailingType.Next)
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      height: scaler.sizer.setHeight(3.5),
                      width: scaler.sizer.setHeight(3.5),
                      // padding: scaler.insets.all(2),
                      decoration: BoxDecoration(
                        color: backgroundColorElse(3)?.withOpacity(0.1) ??
                            widget.tile.backgroundColor,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        InventoryIcon.unie971,
                        color: backgroundColorElse(3) ?? widget.tile.iconColor,
                        // fit: BoxFit.cover,
                      ),
                    ),
                  ),
              ],
            ),
            if (!widget.isFirst)
              EvoteSizedBox(
                height: 0.05,
              ),
            if (widget.tile.isLast ?? false)
              EvoteSizedBox(
                height: 0.75,
              ),
          ],
        ),
      ),
    );
  }
}
