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
  const CustomDrawer({super.key});

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
                        initiallyExpanded: index == provider.selected,
                        key: Key(provider.selected.toString()),
                        onExpansionChanged: (bool expanded) {
                          if (expanded) {
                            menuProvider.setExpandIndex = index;
                          }
                        },
                        showTrailingIcon:
                            item.subMenuItem != null ? true : false,
                        children: buildSubItems(item.subMenuItem, provider),
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

  List<Widget> buildSubItems(
      List<SubMenuItem>? subItems, MenuProvider menuProvider) {
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
              menuProvider.setSubExpandIndex = index;
            },
            showTrailingIcon: item.subOrMenuItem != null ? true : false,
            children: buildSubSubItems(item.subOrMenuItem, menuProvider),
            isSelected: isSelected,
            menuProvider: menuProvider,
            index: index),
      );
    }).toList();
  }

  List<Widget> buildSubSubItems(
      List<SubORMenuItem>? subSubItems, MenuProvider menuProvider) {
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
      shape: const Border(),
      initiallyExpanded: initiallyExpanded,
      visualDensity: const VisualDensity(vertical: -4),
      collapsedIconColor: Colors.grey,
      leading: showLeadingIcon ?? true
          ? Icon(
              Icons.inventory,
              color: isSelected ? Colors.black : Colors.grey,
            )
          : const SizedBox.shrink(),
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
