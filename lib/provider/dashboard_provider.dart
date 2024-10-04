import 'package:flutter/cupertino.dart';
import 'package:parsonskellogg/screen/dashboard/dashboard_page.dart';
import 'package:parsonskellogg/screen/profile/profile_view.dart';

class DashboardProvider extends ChangeNotifier{
  int? _hoveredIndex;

  int? get hoveredIndex => _hoveredIndex;

  void setHoveredIndex(int? index) {
    _hoveredIndex = index;
    notifyListeners();
  }

  Widget _currentPage = const DashboardPage(); // Default page

  Widget get currentPage => _currentPage;
  set updatePage(String value) {
    if (value == "profile") {
      _currentPage = const ProfileView();
    } else {
      _currentPage = Container(); // Default page or other pages
    }
    notifyListeners(); // Notify listeners to rebuild
  }
}