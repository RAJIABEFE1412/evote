import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:quiver/core.dart';

class ProfileSectionModel {
  String? title;
  bool? dontShow;
  List<ProfileSectionTileModel>? tiles;

  ProfileSectionModel({this.title, this.dontShow, this.tiles});

  ProfileSectionModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];

    if (json['dontShow'] == null) {
      dontShow = false;
    } else {
      dontShow = json['dontShow'];
    }

    if (json['tiles'] != null) {
      tiles = <ProfileSectionTileModel>[];
      json['tiles'].forEach((v) {
        tiles!.add(
            new ProfileSectionTileModel.fromJson(Map<String, dynamic>.from(v)));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['dontShow'] = this.dontShow;
    if (this.tiles != null && (!(data['dontShow'] ?? false))) {
      data['tiles'] = this
          .tiles!
          .where((v) {
            return !(v.hide ?? false);
          })
          .toList()
          .map((e) => e.toJson())
          .toList();
      ;
    }
    return data;
  }
}

// class ProfileSectionModel {
//   final String? title;
//   final List<ProfileSectionTileModel>? tiles;

//   const ProfileSectionModel({
//     this.title,
//     this.tiles,
//   });
// }

class ProfileSectionTileModel<T> {
  String? title;
  String? description;
  var icon;
  T? arguments;
  bool? isActive;
  bool? isFavorite;
  bool? isDialog;
  bool? hide;
  bool? isDescriptionBold;
  bool? isConst;
  bool? firstAction;
  bool? isLast;
  bool? notCircle;
  String? route;
  bool? isSvg;
  bool? isText;
  TrailingType? trailingType;
  Color? iconColor;
  Color? backgroundColor;
  bool? showTrailing;

  ProfileSectionTileModel({
    this.title,
    this.description,
    this.isSvg = true,
    this.isText = false,
    this.icon,
    this.isDescriptionBold = false,
    this.isLast = false,
    this.isDialog = false,
    this.notCircle = false,
    this.isConst,
    this.arguments,
    this.isActive,
    this.hide = false,
    this.isFavorite,
    this.firstAction,
    this.backgroundColor,
    this.trailingType = TrailingType.Next,
    this.route,
    this.iconColor,
    this.showTrailing = true,
  });
  ProfileSectionTileModel.fromJson(Map<String, dynamic> json) {
    this.title = json['title'];
    this.description = json['description'];
    this.isFavorite = json["isFavorite"];
    this.isLast = json['isLast'];
    this.notCircle = json['Circle'];
    this.isConst = json['isConst'];
    this.isDescriptionBold = json['isDescriptionBold'];
    this.isSvg = json['isSvg'];
    this.arguments = json['arguments'];
    this.isText = json['isText'];
    this.isDialog = json['isDialog'];
    this.icon = json['icon'];
    this.hide = json['hide'];
    this.trailingType = TrailingType.Next;
    this.isActive = json['isActive'];
    this.firstAction = json['firstAction'];
    this.route = json['route'];
    this.isSvg = json['isSvg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    data['icon'] = this.icon;
    data['isLast'] = this.isLast;
    data['isDialog'] = this.isDialog;
    data['hide'] = this.hide;
    data['notCircle'] = this.notCircle;
    data['isConst'] = this.isConst;
    data['arguments'] = this.arguments;
    data['isActive'] = this.isActive;
    data['isDescriptionBold'] = this.isDescriptionBold;
    data["isFavorite"] = this.isFavorite;
    data['isText'] = this.isText;
    data['firstAction'] = this.firstAction;
    data['route'] = this.route;
    data['isSvg'] = this.isSvg;
    return data;
  }

  @override
  bool operator ==(other) {
    bool a = (other is ProfileSectionTileModel) &&
        title == other.title &&
        route == other.route;
    return a;
  }

  @override
  int get hashCode => hash2(
        title.hashCode,
        route.hashCode,
      );
}

enum TrailingType { Switch, WidgetSelect, TabBar, Next, NONE }
