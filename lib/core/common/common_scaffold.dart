import 'package:flutter/material.dart';
import 'package:parsonskellogg/core/color/color.dart';
import 'package:parsonskellogg/core/common/common_text_widget.dart';
import 'package:parsonskellogg/core/component/component.dart';
import 'package:parsonskellogg/core/constants/num_constants.dart';
import 'package:parsonskellogg/core/image_path/image_path.dart';
import 'package:parsonskellogg/provider/dashboard_provider.dart';
import 'package:parsonskellogg/screen/dashboard/drawer_menu/custom_drawer.dart';
import 'package:provider/provider.dart';

class CommonScaffold extends StatelessWidget {
  const CommonScaffold(
      {super.key, this.child, this.appBar, this.showDrawer = true});

  final Widget? child;
  final PreferredSizeWidget? appBar;
  final bool? showDrawer;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      //backgroundColor: colorBg,
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: appBar ??
          AppBar(
            titleSpacing: showDrawer == false ? null : zero,
            centerTitle: false,
            //backgroundColor: colorBg,
            backgroundColor: Theme.of(context).colorScheme.surface,

            elevation: 0,
            title:
                loadAssetImage(path: icLoginLogo, width: size.width * zero29),
            actions: [
              Container(
                width: thirtyFive,
                height: thirtyFive,
                decoration: commonBoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey, width: one)),
                child: ClipOval(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: loadAssetImage(path: icDummyUser),
                ),
              ),
              const SizedBox(
                width: ten,
              ),
              PopupMenuButton<int>(
                elevation: zero,
                offset: const Offset(0, 30),
                onSelected: handleClick,
                itemBuilder: (context) => [
                  _buildPopupMenuItem(
                      context: context, index: 0, text: 'Profile'),
                  _buildPopupMenuItem(context: context, index: 1, text: 'User'),
                  _buildPopupMenuItem(
                      context: context, index: 2, text: 'System Logs'),
                  _buildPopupMenuItem(
                      context: context, index: 2, text: 'Sign out'),
                ],
                child: Row(
                  children: [
                    CommonTextWidget(
                      text: "Sameer Khan",
                      style: commonTextStyle(fontSize: twelve),
                    ),
                    const Icon(
                      Icons.keyboard_arrow_down_sharp,
                      color: Colors.grey,
                    )
                  ],
                ),
              ),
              const SizedBox(
                width: ten,
              ),
            ],
          ),
      body: child,
      drawer: showDrawer == false ? null : const CustomDrawer(),
    );
  }

  PopupMenuItem<int> _buildPopupMenuItem(
      {required BuildContext context,
      required int index,
      required String text}) {
    return PopupMenuItem<int>(
      value: index,
      child: MouseRegion(
        onEnter: (_) {
          context.read<DashboardProvider>().setHoveredIndex(index);
        },
        onExit: (_) {
          context.read<DashboardProvider>().setHoveredIndex(null);
        },
        child: Consumer<DashboardProvider>(
          builder: (context, hoverProvider, child) {
            return Container(
              padding: const EdgeInsets.all(eight),
              child: CommonTextWidget(
                text: text,
                style: commonTextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: hoverProvider.hoveredIndex == index
                      ? colorButton
                      : Colors.black,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void handleClick(int item) {
    switch (item) {
      case 0:
        break;
      case 1:
        break;
    }
  }
}
