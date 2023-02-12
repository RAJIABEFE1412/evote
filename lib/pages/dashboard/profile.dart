import 'dart:developer';
import 'package:evote/component/app_text.dart';
import 'package:evote/component/inputs/app_sized_box.dart';
import 'package:evote/component/others/gradient_app_bar.dart';
import 'package:evote/component/others/section_tile.dart';
import 'package:evote/component/others/section_title.dart';
import 'package:evote/inventory_icon_icons.dart';
import 'package:evote/models/podos/profile_models.dart';
import 'package:evote/styles/colors.dart';
import 'package:evote/styles/text_styles.dart';
import 'package:evote/utils/extensions.dart';
import 'package:evote/utils/helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class ProfileTab extends StatefulWidget {
  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  void initState() {
    super.initState();

    // checkPinSetUp();
  }

  Color? getContainer(mode) {
    if (mode == 1) {
      return EvoteColors.white;
    } else {
      return EvoteColors.blackBg;
    }
  }

  @override
  Widget build(BuildContext context) {
    final scaler = context.scaler;

    return Container(
      color: EvoteColors.grayScaffold.withOpacity(.2),
      child: Scaffold(
        // backgroundColor: tileColor(mode),
        appBar: EvoteAppBar(
          centerTitle: true,
          gradient: EvoteColors.deepGreenGradient,
          title: EvoteText(
            "Settings",
            style: EvoteTextStyle.medium.copyWith(
              fontSize: 55,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                InventoryIcon.unie90a,
                color: EvoteColors.white,
              ),
            ),
          ],
          bottom: PreferredSize(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: scaler.insets.symmetric(
                    vertical: 2,
                  ),
                  width: scaler.sizer.setHeight(13),
                  height: scaler.sizer.setHeight(13),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: EvoteColors.white, width: 1.5),
                    image: DecorationImage(
                      image: AssetImage("f"),
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                    ),
                  ),
                ),
                EvoteSizedBox(height: 1.5),
                EvoteText(
                  "YOMI's PAGE",
                  style: EvoteTextStyle.bold.copyWith(
                    color: EvoteColors.white,
                  ),
                ),
                EvoteSizedBox(height: 1),
                // InkWell(
                //   onTap: () {},
                //   child: EvoteText(
                //     "Show Details",
                //     style: EvoteTextStyle.black.copyWith(
                //       color: EvoteColors.white,
                //       fontSize: 38,
                //     ),
                //   ),
                // ),
                // EvoteSizedBox(
                //   height: 1.5,
                // ),
              ],
            ),
            preferredSize: Size(100, 180),
          ),
        ),
        body: CustomScrollView(
          slivers: [
            for (final section in settingsInApp)
              SliverPadding(
                padding: scaler.insets.only(
                  bottom: 0.75,
                ),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, idx) {
                      if (idx == 0) {
                        return Container(
                          color: getContainer(1),
                          padding: scaler.insets.only(
                            top: 1.5,
                          ),
                          child: SectionTitle(
                            section.title ?? "",
                          ),
                        );
                      }
                      final tile = section.tiles![idx - 1];

                      return SectionTile(
                        tile,
                        isFirst: idx == 1,
                        onTap: () async {},
                      );
                    },
                    childCount: ((section.tiles?.length ?? 0) + 1),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

List<ProfileSectionModel> get settingsInApp {
  return [
    ProfileSectionModel(
      title: "Profile and KYC",
      tiles: [
        ProfileSectionTileModel(
          title: "Edit Profile",
          icon: "edit",
          backgroundColor: EvoteColors.greenPaleDark.withOpacity(0.2),
          iconColor: EvoteColors.blueDeep,
          // route: EvoteRoutes.editProfile,
        ),
        ProfileSectionTileModel(
          title: "User Management",
          icon: "unie966",
          backgroundColor: EvoteColors.greenPaleDark.withOpacity(0.2),
          iconColor: EvoteColors.blueDeep,
          // route: EvoteRoutes.employerKYC,
        ),
      ],
    ),
    ProfileSectionModel(
      title: "User data",
      tiles: [
        ProfileSectionTileModel(
          title: "Polling booths",
          icon: "changePin",
          backgroundColor: EvoteColors.greenPaleDark.withOpacity(0.2),
          iconColor: EvoteColors.blueDeep,
          // route: EvoteRoutes.passwordReset,
        ),
        ProfileSectionTileModel(
          title: "Information",
          icon: "changePin",
          backgroundColor: EvoteColors.greenPaleDark.withOpacity(0.2),
          iconColor: EvoteColors.blueDeep,
          // route: EvoteRoutes.resetPinNum,
        ),

        // ProfileSectionTileModel(
        //   title: "Auto Login on app start",
        //   isActive: getAutoLogin,
        //   trailingType: TrailingType.Switch,
        //   icon: 'unie966',
        //   backgroundColor: EvoteColors.greenPaleDark.withOpacity(0.2),
        //   iconColor: EvoteColors.blueDeep,
        // ),
      ],
    ),
    ProfileSectionModel(
      tiles: [
        ProfileSectionTileModel(
          title: "Logout",
          icon: 'logout',
          isSvg: true,
          showTrailing: false, isLast: true,
          backgroundColor: Color(0xFFFDE4E1),
          iconColor: Color(0xFFFF0000), // route: EvoteRoutes.profileBvn,
        ),
      ],
    ),
  ];
}
