import 'package:flutter/cupertino.dart';

class DashboardProvider extends ChangeNotifier{
  int? _hoveredIndex;

  int? get hoveredIndex => _hoveredIndex;

  void setHoveredIndex(int? index) {
    _hoveredIndex = index;
    notifyListeners();
  }


}