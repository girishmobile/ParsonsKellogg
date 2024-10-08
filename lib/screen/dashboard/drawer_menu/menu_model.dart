import 'package:flutter/cupertino.dart';

class MenuModel {
  String? title;
  int titleIndex = -1;
  bool isExpanded;
  Widget ? icon;

  List<SubMenuItem>? subMenuItem;

  MenuModel(
      {this.title,
      this.subMenuItem,
        this.icon,
      required this.titleIndex,
      this.isExpanded = false});
}

class SubMenuItem {
  String? title;
  bool? isBold = false;
  int? index;
  bool isExpanded;
  List<SubORMenuItem>? subOrMenuItem;

  SubMenuItem(
      {this.title,
      this.isBold,
      this.index,
      this.subOrMenuItem,
      this.isExpanded = false});
}

class SubORMenuItem {
  String? title;
  bool? isBold = false;
  int? index;

  SubORMenuItem({this.title, this.isBold, this.index});
}
