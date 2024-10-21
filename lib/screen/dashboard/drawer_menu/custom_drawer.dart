import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parsonskellogg/core/color/color.dart';
import 'package:parsonskellogg/core/common/common_text_widget.dart';
import 'package:parsonskellogg/core/component/component.dart';
import 'package:parsonskellogg/core/constants/num_constants.dart';
import 'package:parsonskellogg/provider/menu_provider.dart';
import 'package:parsonskellogg/screen/dashboard/drawer_menu/menu_model.dart';
import 'package:provider/provider.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key, required this.onSelectedPage});
  final Function(String) onSelectedPage;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    final menuProvider = Provider.of<MenuProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      menuProvider.loadMenu();
    });
    return Consumer<MenuProvider>(builder: (context, provider, child) {
      return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: eighty,
                    width: eighty,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: CommonTextWidget(
                        text: 'PK',
                        style: commonTextStyle(),
                      ),
                    ),
                  ),
                  const SizedBox(height: eight),
                  CommonTextWidget(
                    text: 'PARSONSKELLOGG',
                    style: commonTextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: size.width,
              height: size.height,
              child: ListView(
                padding: EdgeInsets.zero,
                children: provider.itemMenu.asMap().entries.map((items) {
                  int index = items.key;
                  var item = items.value;
                  final isSelected = menuProvider.expandedIndex == index;
                  return Container(
                    child: commonListView(
                        item: item,
                        leading: items.value.icon,
                        initiallyExpanded: index == provider.selected,
                        key: Key(provider.selected.toString()),
                        onExpansionChanged: (bool expanded) {
                          onSelectedPage('Header_${item.title.toString()}');
                          // print('=================================header=====index#${item.title}');
                          if (expanded) {
                            menuProvider.setExpandIndex = index;
                            //Navigator.of(context).pop();
                          }
                          if (item.subMenuItem == null) {
                            Navigator.of(context).pop();
                          }
                        },
                        showTrailingIcon:
                            item.subMenuItem != null ? true : false,
                        children: buildSubItems(item.subMenuItem, context,
                            provider, onSelectedPage),
                        isSelected: isSelected,
                        menuProvider: menuProvider,
                        index: index),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      );
    });
  }

  List<Widget> buildSubItems(List<SubMenuItem>? subItems, BuildContext context,
      MenuProvider menuProvider, final Function(String) onSelectedPage) {
    if (subItems == null) return [];

    return subItems.asMap().entries.map<Widget>((subItem) {
      int index = subItem.key;
      var item = subItem.value;
      final isSelected = menuProvider.expandedSubIndex == index;
      return Container(
        child: commonListView(
            item: item,
            showLeadingIcon: false,
            onExpansionChanged: (bool expanded) {
              onSelectedPage('child_${item.title.toString()}');
              menuProvider.setSubExpandIndex = index;
              if (item.subOrMenuItem == null) {
                Navigator.of(context).pop();
              }
            },
            showTrailingIcon: item.subOrMenuItem != null ? true : false,
            children: buildSubSubItems(
                item.subOrMenuItem, menuProvider, onSelectedPage),
            isSelected: isSelected,
            menuProvider: menuProvider,
            index: index),
      );
    }).toList();
  }

  List<Widget> buildSubSubItems(List<SubORMenuItem>? subSubItems,
      MenuProvider menuProvider, final Function(String) onSelectedPage) {
    if (subSubItems == null) return [];
    return subSubItems.asMap().entries.map<Widget>((subSubItem) {
      int index = subSubItem.key;
      var item = subSubItem.value;
      final isSelected = menuProvider.expandedSubSubIndex == index;
      return Container(
        child: commonListView(
            children: [],
            isSelected: isSelected,
            showLeadingIcon: false,
            item: item,
            left: twenty,
            menuProvider: menuProvider,
            showTrailingIcon: false,
            onExpansionChanged: (bool expanded) {
              onSelectedPage('sub_child_${item.title.toString()}');
              menuProvider.setSubSubExpandIndex = index;
            },
            index: index),
        // title: Text(subSubItem.title.toString()),
      );
    }).toList();
  }

  commonListView(
      {required List<Widget> children,
      required bool isSelected,
      required MenuProvider menuProvider,
      required bool showTrailingIcon,
      double? left,
      Key? key,
      Widget? leading,
      Color? colorBg,
      bool? showLeadingIcon = true,
      bool? isHeading = false,
      bool initiallyExpanded = false,
      required void Function(bool)? onExpansionChanged,
      required int index,
      Widget? text,
      dynamic item}) {
    return ExpansionTile(
      key: key,
      collapsedBackgroundColor: Colors.white,
      backgroundColor: colorBg,
      iconColor: colorText,
      shape: const Border(),
      initiallyExpanded: initiallyExpanded,
      visualDensity: const VisualDensity(vertical: -4),
      collapsedIconColor: Colors.grey,
      leading: showLeadingIcon ?? true ? leading : const SizedBox.shrink(),
      onExpansionChanged: onExpansionChanged,
      showTrailingIcon:
          showTrailingIcon /*item.subMenuItem != null ? true : false*/,
      title: text ??
          CommonTextWidget(
              left: left,
              text: item.title.toString(),
              style: GoogleFonts.outfit(
                fontSize: twelve,
                color: isSelected ? colorText : colorText,
                fontWeight: isSelected ? FontWeight.w800 : FontWeight.w500,
              )),
      children: children,
    );
  }
}
