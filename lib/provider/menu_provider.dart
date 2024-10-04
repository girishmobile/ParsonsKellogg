import 'package:flutter/material.dart';
import 'package:parsonskellogg/screen/dashboard/drawer_menu/menu_model.dart';

class MenuProvider extends ChangeNotifier {
  int _selectedMenu = -1;
  int _expandedIndex = -1;
  int _expandedSubIndex = -1;
  int _expandedSubSubIndex = -1;
  int _selected = -1;

  int get selectedMenu => _selectedMenu;

  int get selected => _selected;
  int get expandedIndex => _expandedIndex;
  int get expandedSubIndex => _expandedSubIndex;
  int get expandedSubSubIndex => _expandedSubSubIndex;
  set selectMenu(int menu) {
    _selectedMenu = menu;
    notifyListeners();
  }

  set setExpandIndex(int index) {
    _expandedIndex = index;
    notifyListeners();
  }

  set setSubExpandIndex(int index) {
    _expandedSubIndex = index;
    notifyListeners();
  }

  set setSubSubExpandIndex(int index) {
    _expandedSubSubIndex = index;
    notifyListeners();
  }

  bool _isExpanded = false;

  bool get isExpanded => _isExpanded;

  /*-------------------------------Menu-----------------------------------*/
  List<MenuModel> _itemMenu = [];

  List<MenuModel> get itemMenu => _itemMenu;
  void toggleExpansion(int index) {
    _itemMenu[index].isExpanded = !_itemMenu[index].isExpanded;
    notifyListeners();
  }

  void loadMenu() {
    notifyListeners();

    _itemMenu = [
      MenuModel(
        title: "Dashboard",
        titleIndex: 500,
      ),
      MenuModel(title: "Master Product Feed", titleIndex: 501, subMenuItem: [
        SubMenuItem(index: 0, title: "Dashboard"),
        SubMenuItem(index: 1, title: "Product Database"),
        SubMenuItem(index: 2, title: "Core ProductFeed"),
        SubMenuItem(
            index: 3,
            title: "Configurator",
            isBold: true,
            subOrMenuItem: [
              SubORMenuItem(index: 1001, title: "ddd"),
              SubORMenuItem(index: 1002, title: "ddd Database"),
              SubORMenuItem(index: 1003, title: "Cordddde ProductFeed"),
            ]),
        SubMenuItem(index: 4, title: "Setting", isBold: true),
      ]),
      MenuModel(title: "Store", titleIndex: 502, subMenuItem: [
        SubMenuItem(index: 5, title: "Dashboard"),
        SubMenuItem(index: 6, title: "All Store", isBold: true),
        SubMenuItem(index: 7, title: "Ecommerce", isBold: true),
        SubMenuItem(index: 8, title: "Corporate Store", isBold: true),
        SubMenuItem(index: 9, title: "Store Builder", isBold: true),
        SubMenuItem(index: 10, title: "Form Builder", isBold: true),
      ]),
      MenuModel(title: "Content Management", titleIndex: 503, subMenuItem: [
        SubMenuItem(index: 11, title: "Dashboard"),
        SubMenuItem(index: 12, title: "Content"),
        SubMenuItem(index: 13, title: "Template"),
        SubMenuItem(index: 14, title: "Asset Library"),
        SubMenuItem(index: 15, title: "Story Category"),
      ]),
      MenuModel(title: "Customer", titleIndex: 504, subMenuItem: [
        SubMenuItem(index: 16, title: "Dashboard"),
        SubMenuItem(index: 17, title: "Customer"),
        SubMenuItem(index: 18, title: "Company"),
        SubMenuItem(index: 19, title: "Consultation Request"),
        SubMenuItem(index: 20, title: "Contact Us"),
        SubMenuItem(index: 21, title: "Abandoned Shopping cart"),
        SubMenuItem(index: 22, title: "Customer Application List"),
        SubMenuItem(index: 23, title: "Manage Bulk Tier"),
        SubMenuItem(index: 24, title: "Customer Gift Card"),
        SubMenuItem(index: 25, title: "Special Request"),
        SubMenuItem(index: 26, title: "Customer Quote List"),
      ]),
      MenuModel(title: "Promotion", titleIndex: 505, subMenuItem: [
        SubMenuItem(index: 27, title: "Coupon Codes"),
      ]),
      MenuModel(title: "Orders", titleIndex: 506, subMenuItem: [
        SubMenuItem(index: 28, title: "Dashboard"),
        SubMenuItem(index: 29, title: "Order List"),
        SubMenuItem(index: 30, title: "Draft/ Phone Order"),
      ]),
      MenuModel(title: "Setting", titleIndex: 507, subMenuItem: [
        SubMenuItem(index: 31, title: "Dashboard"),
        SubMenuItem(index: 32, title: "Profile"),
        SubMenuItem(index: 33, title: "Roles"),
        SubMenuItem(index: 34, title: "Users"),
        SubMenuItem(index: 35, title: "System Log"),
        SubMenuItem(index: 36, title: "Activity Activity"),
      ]),
      MenuModel(title: "Admin theme", titleIndex: 508, subMenuItem: [
        SubMenuItem(index: 37, title: "Company Configuration"),
        SubMenuItem(index: 38, title: "Modules"),
        SubMenuItem(index: 39, title: "SEO Configuration"),
        SubMenuItem(index: 40, title: "Theme Configuration"),
        SubMenuItem(index: 41, title: "Third Party Service"),
        SubMenuItem(index: 42, title: "Setting"),
        SubMenuItem(index: 43, title: "Widget Module Mapping"),
      ]),
      MenuModel(
        title: "Google Analytics",
        titleIndex: 509,
      ),
      MenuModel(
        title: "Report",
        titleIndex: 510,
      ),
    ];
  }
}
