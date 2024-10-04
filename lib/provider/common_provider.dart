import 'package:flutter/cupertino.dart';

class CommonProvider extends ChangeNotifier{
  String _title = '';
  String _message = '';
  bool _isDialogVisible = false;
  List<Widget> _actions = [];

  String get title => _title;
  String get message => _message;
  bool get isDialogVisible => _isDialogVisible;
  List<Widget> get actions => _actions;

  void showDialog({required String title, required String message, required List<Widget> actions}) {
    _title = title;
    _message = message;
    _actions = actions;
    _isDialogVisible = true;
    notifyListeners();
  }

  void hideDialog() {
    _isDialogVisible = false;
    notifyListeners();
  }

}