import 'package:flutter/material.dart';
import 'package:parsonskellogg/core/color/color.dart';
import 'package:parsonskellogg/core/common/common_text_widget.dart';
import 'package:parsonskellogg/core/component/component.dart';
import 'package:parsonskellogg/core/constants/num_constants.dart';
import 'package:parsonskellogg/core/image_path/image_path.dart';
import 'package:parsonskellogg/core/router/route_name.dart';
import 'package:parsonskellogg/core/string_utils/string_utils.dart';
import 'package:parsonskellogg/provider/dashboard_provider.dart';
import 'package:parsonskellogg/screen/dashboard/drawer_menu/custom_drawer.dart';
import 'package:provider/provider.dart';

class CommonScaffold extends StatelessWidget {
  const CommonScaffold(
      {super.key, this.child, this.appBar, this.showDrawer = true,required this.onSelectedPage,this.endDrawer});

  final Widget? child;
  final Widget? endDrawer;
  final PreferredSizeWidget? appBar;
  final bool? showDrawer;
  final Function(String) onSelectedPage;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(

      backgroundColor: colorBg,
      endDrawer: endDrawer,
      appBar: appBar ??
          AppBar(
            elevation: 0.4,
            titleSpacing: showDrawer == false ? null : zero,
            centerTitle: false,
            backgroundColor: colorBg,
            title:
                loadAssetImage(path: icLoginLogo, width: size.width * zero29),
            actions: [
              Container(

                width: thirtyFive,
                height: thirtyFive,
                clipBehavior: Clip.antiAlias,
                decoration: commonBoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey, width: one)),
                child: loadAssetImage(path: icDummyUser),
              ),

              const SizedBox(
                width: ten,
              ),
              PopupMenuButton<int>(
                elevation: zero,
                offset: const Offset(0, 30),
                onSelected: (value) {
                  if(value==0){
                    onSelectedPage("profile");
                  }
                  if (value == 3) {
                    showCommonDialog(
                      title: logout,
                      isMessage: false,
                      content: logoutDesc,
                        context: context,
                        btnPositive: logout,
                        onPressPositive: () {
                          Navigator.pushNamedAndRemoveUntil(context,
                              RouteName.loginScreen, (Route<dynamic> route) => false);
                        });
                  }
                },
                itemBuilder: (context) => [
                  _buildPopupMenuItem(
                      context: context, index: 0, text: profile),
                  _buildPopupMenuItem(context: context, index: 1, text: users),
                  _buildPopupMenuItem(
                      context: context, index: 2, text: systemLog),
                  _buildPopupMenuItem(
                      context: context, index: 3, text: signOut),
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
      drawer: showDrawer == false ? null :  CustomDrawer(onSelectedPage:onSelectedPage ,),
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
                  fontSize: twelve,
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

}
