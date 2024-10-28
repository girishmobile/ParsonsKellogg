import 'package:flutter/material.dart';
import 'package:parsonskellogg/core/color/color.dart';
import 'package:parsonskellogg/core/component/component.dart';
import 'package:parsonskellogg/core/constants/num_constants.dart';

class CommonTabBarWidget extends StatelessWidget {
  const CommonTabBarWidget(
      {super.key,
      required this.length,
      required this.children,
      required this.tabs});

  final int length;
  final List<Widget> tabs;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: length, // Number of tabs
      child: Column(
        children: [
          SizedBox(
            height: forty,
            child: TabBar(
              isScrollable: true,
              dividerColor: Colors.transparent,
              physics: const ClampingScrollPhysics(),
              labelColor: Colors.white,
              unselectedLabelColor: colorText,
              unselectedLabelStyle: commonTextStyle(
                  fontSize: eleven, fontWeight: FontWeight.w600),
              labelStyle: commonTextStyle(
                  fontSize: eleven, fontWeight: FontWeight.w600),
              indicatorSize: TabBarIndicatorSize.tab,
              tabAlignment: TabAlignment.start,
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(eight), color: colorTab),
              tabs: tabs,
            ),
          ),
          Expanded(
              child: TabBarView(
            children: children,
          ))
        ],
      ),
    );
  }
}
