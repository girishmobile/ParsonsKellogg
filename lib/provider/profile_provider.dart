import 'package:flutter/material.dart';

class ProfileProvider extends ChangeNotifier {
  final tetFName = TextEditingController();
  final tetLName = TextEditingController();
  final tetPhone = TextEditingController();
  final tetCurrentPassword = TextEditingController();
  final tetNewPassword = TextEditingController();
  final tetReEnterPassword = TextEditingController();

  String _fName = '';
  String _lName = '';
  String _phone = '';
  String _currentPassword = '';
  String _newPassword = '';
  String _reEnterPassword = '';

  String get fName => _fName;

  String get lName => _lName;

  String get phone => _phone;

  String get currentPassword => _currentPassword;

  String get newPassword => _newPassword;

  String get reEnterPassword => _reEnterPassword;

  final formLoginKey = GlobalKey<FormState>();
  bool _isChecked = false;

  bool _switchNotificationValue = true;

  bool get isChecked => _isChecked;

  bool get switchNotificationValue => _switchNotificationValue;

  void toggleCheckbox(bool? value) {
    _isChecked = value ?? false;
    notifyListeners();
  }

  set setNotification(bool value) {
    _switchNotificationValue = value;
    notifyListeners();
  }

  bool _isCheckedReceive = false;

  bool get isCheckedReceive => _isCheckedReceive;

  void toggleCheckReview(bool? value) {
    _isCheckedReceive = value ?? false;
    notifyListeners();
  }

  ///show hide Password View
  bool _isVisiblePassword = false;

  bool get isVisiblePassword => _isVisiblePassword;

  void toggleVisibility() {
    _isVisiblePassword = !_isVisiblePassword;
    notifyListeners();
  }

  set setFName(String fName) {
    _fName = fName;
    notifyListeners();
  }

  set setLName(String lName) {
    _lName = lName;
    notifyListeners();
  }

  set setPhone(String phone) {
    _phone = phone;
    notifyListeners();
  }

  set setCurrentPassword(String currentPassword) {
    _currentPassword = currentPassword;
    notifyListeners();
  }

  set setNewPassword(String newPassword) {
    _newPassword = newPassword;
    notifyListeners();
  }

  set setReEnterPassword(String reEnterPassword) {
    _reEnterPassword = reEnterPassword;
    notifyListeners();
  }

  //=========================================load Notification Data=====================

  void toggleSwitch(int index) {
    _notification[index].isSwitched = !_notification[index].isSwitched;
    notifyListeners();
  }

  final List<SwitchItem> _notification = [
    SwitchItem(
        name: "Comments and replies",
        desc:
            "Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit.",
        isSwitched: false),
    SwitchItem(
        name: "Messages",
        desc:
            "Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit.",
        isSwitched: false)
  ];

  List<SwitchItem> get notification => _notification;

  //=============================================System Log

  int _sortColumnIndex = 0;
  int _rowsPerPageValue = 0;
  bool _isAscending = true;

  final int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;

  int get rowsPerPage => _rowsPerPage;

  int get rowsPerPageValue => _rowsPerPageValue;

  int get sortColumnIndex => _sortColumnIndex;

  bool get isAscending => _isAscending;

  List<Map<String, dynamic>> get activityLogs => _activityLogs;

  set setRowPerPageValue(int value) {
    _rowsPerPageValue = value;
  }

  set setSortColumnIndex(int value) {
    _sortColumnIndex = value;
  }

  set setIsAscending(bool value) {
    _isAscending = value;
  }

  // You can add methods to modify the data and notify listeners

  void sortActivityLogs<T>(
      Comparable<T> Function(Map<String, dynamic> log) getField,
      bool ascending) {
    _activityLogs.sort((a, b) {
      final aValue = getField(a);
      final bValue = getField(b);
      return ascending
          ? Comparable.compare(aValue, bValue)
          : Comparable.compare(bValue, aValue);
    });
    notifyListeners();
  }

  void sort<T>(
      Comparable<T> Function(Map<String, dynamic> log) getField,
      int columnIndex,
      bool ascending,
      ProfileProvider provider,
      BuildContext context) {
    provider.setSortColumnIndex = columnIndex;
    provider.setIsAscending = ascending;
    final activityLogProvider = sortActivityLogs<T>(getField, ascending);
  }

  List<Map<String, dynamic>> _filteredData = [];

  List<Map<String, dynamic>> get filteredData => _filteredData;

  void filter(String query) {

    if (query.isEmpty) {
      _filteredData = List.from(_activityLogs);
    } else {
      _filteredData = _activityLogs
          .where((data) =>
              data['user'].toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }

  final List<Map<String, dynamic>> _activityLogs = [
    {
      "user": "Teena Khan",
      "browser": "Chrome/129.0.0.0\n- Windows 10.0",
      "date": "09/30/2024 03:11 AM",
      "activity": "Login",
      "ip": "27.54.168.197",
      "location": "RI"
    },
    {
      "user": "Sameer Khan",
      "browser": "Chrome/129.0.0.0 \n- Windows 10.0",
      "date": "09/30/2024 02:07 AM",
      "activity": "Logout",
      "ip": "27.54.168.197",
      "location": "RI"
    },
    {
      "user": "Sam Khan",
      "browser": "Chrome/129.0.0.0\n- Windows 10.0",
      "date": "09/30/2024 03:11 AM",
      "activity": "Login",
      "ip": "27.54.168.197",
      "location": "RI"
    },
    {
      "user": "Sameer Khan",
      "browser": "Chrome/129.0.0.0 \n- Windows 10.0",
      "date": "09/30/2024 02:07 AM",
      "activity": "Logout",
      "ip": "27.54.168.197",
      "location": "RI"
    },
    {
      "user": "Sameer Khan",
      "browser": "Chrome/129.0.0.0\n- Windows 10.0",
      "date": "09/30/2024 03:11 AM",
      "activity": "Login",
      "ip": "27.54.168.197",
      "location": "RI"
    },
    {
      "user": "Sameer Khan",
      "browser": "Chrome/129.0.0.0 \n- Windows 10.0",
      "date": "09/30/2024 02:07 AM",
      "activity": "Logout",
      "ip": "27.54.168.197",
      "location": "RI"
    },
    {
      "user": "Sameer Khan",
      "browser": "Chrome/129.0.0.0\n- Windows 10.0",
      "date": "09/30/2024 03:11 AM",
      "activity": "Login",
      "ip": "27.54.168.197",
      "location": "RI"
    },
    {
      "user": "Sameer Khan",
      "browser": "Chrome/129.0.0.0 \n- Windows 10.0",
      "date": "09/30/2024 02:07 AM",
      "activity": "Logout",
      "ip": "27.54.168.197",
      "location": "RI"
    },
    {
      "user": "Sameer Khan",
      "browser": "Chrome/129.0.0.0\n- Windows 10.0",
      "date": "09/30/2024 03:11 AM",
      "activity": "Login",
      "ip": "27.54.168.197",
      "location": "RI"
    },
    {
      "user": "Sameer Khan",
      "browser": "Chrome/129.0.0.0 \n- Windows 10.0",
      "date": "09/30/2024 02:07 AM",
      "activity": "Logout",
      "ip": "27.54.168.197",
      "location": "RI"
    },
    {
      "user": "Sameer Khan",
      "browser": "Chrome/129.0.0.0\n- Windows 10.0",
      "date": "09/30/2024 03:11 AM",
      "activity": "Login",
      "ip": "27.54.168.197",
      "location": "RI"
    },
    {
      "user": "Sameer Khan",
      "browser": "Chrome/129.0.0.0 \n- Windows 10.0",
      "date": "09/30/2024 02:07 AM",
      "activity": "Logout",
      "ip": "27.54.168.197",
      "location": "RI"
    },
    {
      "user": "Sameer Khan",
      "browser": "Chrome/129.0.0.0\n- Windows 10.0",
      "date": "09/30/2024 03:11 AM",
      "activity": "Login",
      "ip": "27.54.168.197",
      "location": "RI"
    },
    {
      "user": "Sameer Khan",
      "browser": "Chrome/129.0.0.0 \n- Windows 10.0",
      "date": "09/30/2024 02:07 AM",
      "activity": "Logout",
      "ip": "27.54.168.197",
      "location": "RI"
    },
    // Add more data entries here
  ];


  //========================================for columns dialog

  Map<String, bool> _columnsVisibility = {
    'PAGE': true,
    'MODULE': true,
    'EVENT': false,
    'USER': true,
    'DATE': true,
    'IP ADDRESS': true,
  };

  Map<String, bool> get columnsVisibility => _columnsVisibility;

  void toggleColumn(String column) {
    _columnsVisibility[column] = !_columnsVisibility[column]!;
    notifyListeners();
  }

  String _searchTerm = '';
  List<String> get filteredColumns {
    if (_searchTerm.isEmpty) {
      return _columnsVisibility.keys.toList();
    }
    return _columnsVisibility.keys
        .where((column) => column.toLowerCase().contains(_searchTerm.toLowerCase()))
        .toList();
  }
  void updateSearchTerm(String term) {
    _searchTerm = term;
    notifyListeners();
  }

}

class SwitchItem {
  final String name;
  final String desc;
  bool isSwitched;

  SwitchItem({required this.name, this.isSwitched = false, required this.desc});
}
