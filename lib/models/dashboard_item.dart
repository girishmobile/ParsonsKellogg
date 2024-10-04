import 'package:flutter/material.dart';

class DashboardItem {
  const DashboardItem(
      {required this.id,
      required this.title,
      required this.subTitle,
      this.iconName = Icons.ac_unit_outlined});
  final String id;
  final String title;
  final String subTitle;
  final IconData iconName;
}
