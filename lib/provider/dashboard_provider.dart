import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:parsonskellogg/core/component/component.dart';

import 'package:parsonskellogg/screen/dashboard/dashboard_page/dashboard_page.dart';
import 'package:parsonskellogg/screen/master_product_feed/master_dashboard_screen.dart';
import 'package:parsonskellogg/screen/master_product_feed/product_database_screen.dart';
import 'package:parsonskellogg/screen/profile/profile_view.dart';

import '../models/dashboard_item.dart';

class OrderData {
  final String state;
  final int orders;
  final double revenue;

  OrderData({required this.state, required this.orders, required this.revenue});
}

class DashboardProvider extends ChangeNotifier {
  int? _hoveredIndex;

  int? get hoveredIndex => _hoveredIndex;

  void setHoveredIndex(int? index) {
    _hoveredIndex = index;
    notifyListeners();
  }

  Widget _currentPage = const DashboardPage(); // Default page

//****************************************** Navigation of Menu Item *******************************************
  Widget get currentPage => _currentPage;
  set updatePage(String value) {
    if (value == "Header_Dashboard") {
      _currentPage = const DashboardPage();
    } else if (value == 'child_Dashboard') {
      _currentPage = const MasterDashboardScreen();
    } else if (value == 'child_Product Database') {
      _currentPage = const ProductDatabaseScreen();
    } else if (value == "profile") {
      _currentPage = const ProfileView();
    } else {
      _currentPage = Center(
        child: commonText(text: "page not found"),
      ); // Default page or other pages
    }
    notifyListeners(); // Notify listeners to rebuild
  }

  //for map

  final Map<String, OrderData> _orders = {
    "Nevada": OrderData(state: "Nevada", orders: 34, revenue: 109149.83),
    // Add other states here
  };

  Map<String, OrderData> get orders => _orders;

  void updateOrders(String state, int orders, double revenue) {
    _orders[state] = OrderData(state: state, orders: orders, revenue: revenue);
    notifyListeners();
  }
//===============================for filter=================================

  String? _selectedValueDuration;
  String? get selectedValueDuration => _selectedValueDuration;
  set selectionValueDuration(String newPin) {
    _selectedValueDuration = newPin;
    notifyListeners();
  }

  String? _selectedValueAllStore;
  String? get selectedValueAllStore => _selectedValueAllStore;
  set selectionValueAllStore(String newPin) {
    _selectedValueAllStore = newPin;
    notifyListeners();
  }

  final List<String> itemsAllDuration = [
    'All Duration',
    'Last 24 hours',
    'Last 1 Week',
    'Last 30 days',
    'Current years',
    'Previous Half Year',
    'Previous Year',
  ];

  final List<String> itemsAllStore = [
    'All Store ',
    '24 On tour',
    'Uniti',
  ];

  //Dashboard
  List<DashboardItem> get dashboardItem => _dashboardItem;
  final List<DashboardItem> _dashboardItem = [
    const DashboardItem(
      id: 'd1',
      title: 'Master Product Feed',
      subTitle: 'PRODUCT MANAGEMENT',
      iconName: Icons.library_books_outlined,
    ),
    const DashboardItem(
      id: 'd2',
      title: 'Content Management',
      subTitle: 'CONTENT MANAGEMENT',
      iconName: Icons.article_outlined,
    ),
    const DashboardItem(
      id: 'd3',
      title: 'Stores',
      subTitle: 'STORES MANAGEMENT',
      iconName: Icons.fact_check_outlined,
    ),
    const DashboardItem(
      id: 'd4',
      title: 'Store Builder',
      subTitle: 'STORE BUILDER MANAGEMENT',
      iconName: Icons.add_business_outlined,
    ),
    const DashboardItem(
      id: 'd5',
      title: 'Form Builder',
      subTitle: 'FORM BUILDER MANAGEMENT',
      iconName: Icons.analytics_outlined,
    ),
    const DashboardItem(
      id: 'd6',
      title: 'Promotions',
      subTitle: 'PROMOTIONS MANAGEMENT',
      iconName: Icons.local_offer_outlined,
    ),
    const DashboardItem(
      id: 'd7',
      title: 'Orders',
      subTitle: 'ORDERS MANAGEMENT',
      iconName: Icons.local_mall_outlined,
    ),
    const DashboardItem(
      id: 'd8',
      title: 'Customers',
      subTitle: 'CUSTOMERS MANAGEMENT',
      iconName: Icons.people_alt_outlined,
    ),
  ];
//==================================================================Dashboard Widget List

  List<DashboardItem> get dashboardWidgetItem => _dashboardWidgetItem;
  final List<DashboardItem> _dashboardWidgetItem = [
    const DashboardItem(
      id: 'd1',
      imageUrl:
          "https://storagemedia.corporategear.com/storagemedia/common/chartimages/Last10Orders.png",
      title: 'Last 10 orders',
      iconName: Icons.drag_indicator,
    ),
    const DashboardItem(
      id: 'd1',
      imageUrl:
          "https://storagemedia.corporategear.com/storagemedia/common/chartimages/Last10Orders.png",
      title: 'Order By Store',
      iconName: Icons.drag_indicator,
    ),
    const DashboardItem(
      id: 'd1',
      imageUrl:
          "https://storagemedia.corporategear.com/storagemedia/common/chartimages/DRAFTPAGES.png",
      title: 'Draft Page',
      iconName: Icons.drag_indicator,
    ),
    const DashboardItem(
      id: 'd1',
      imageUrl:
          "https://storagemedia.corporategear.com/storagemedia/common/chartimages/MetaKeywords.png",
      title: 'Meta Keyword',
      iconName: Icons.drag_indicator,
    ),
    const DashboardItem(
      id: 'd1',
      imageUrl:
          "https://storagemedia.corporategear.com/storagemedia/common/chartimages/MetaKeywords.png",
      title: 'Page Title',
      iconName: Icons.drag_indicator,
    ),
    const DashboardItem(
      id: 'd1',
      imageUrl:
          "https://storagemedia.corporategear.com/storagemedia/common/chartimages/Top10ItemsbySales.png",
      title: 'Top 10 Items by Sales',
      iconName: Icons.drag_indicator,
    ),
    const DashboardItem(
      id: 'd1',
      imageUrl:
          "https://storagemedia.corporategear.com/storagemedia/common/chartimages/Top5Stores.png",
      title: 'Top 5 Stores',
      iconName: Icons.drag_indicator,
    ),
    const DashboardItem(
      id: 'd1',
      imageUrl:
          "https://storagemedia.corporategear.com/storagemedia/common/chartimages/CustomerOrderReport.png",
      title: 'Customer Order Report',
      iconName: Icons.drag_indicator,
    ),
    const DashboardItem(
      id: 'd1',
      imageUrl:
          "https://storagemedia.corporategear.com/storagemedia/common/chartimages/OrderReport.png",
      title: 'Order Report',
      iconName: Icons.drag_indicator,
    ),
    const DashboardItem(
      id: 'd1',
      imageUrl:
          "https://storagemedia.corporategear.com/storagemedia/common/chartimages/ProductNAVSyncStatusReport.png",
      title: 'Product NAV Sync Status Report',
      iconName: Icons.drag_indicator,
    ),
    const DashboardItem(
      id: 'd1',
      imageUrl:
          "https://storagemedia.corporategear.com/storagemedia/common/chartimages/ProductStatusReport.png",
      title: 'Product Status Report',
      iconName: Icons.drag_indicator,
    ),
    const DashboardItem(
      id: 'd1',
      imageUrl:
          "https://storagemedia.corporategear.com/storagemedia/common/chartimages/PUBLISHEDPAGES.png",
      title: 'Published Page',
      iconName: Icons.drag_indicator,
    ),
    const DashboardItem(
      id: 'd1',
      imageUrl:
          "https://storagemedia.corporategear.com/storagemedia/common/chartimages/SECUREPAGES.png",
      title: 'Secure Page',
      iconName: Icons.drag_indicator,
    ),
    const DashboardItem(
      id: 'd1',
      imageUrl:
          "https://storagemedia.corporategear.com/storagemedia/common/chartimages/Top10CustomerApplicationRequest.png",
      title: 'Top 10 Customer Application Request',
      iconName: Icons.drag_indicator,
    ),
  ];

  //top ten record

  int _sortColumnIndex = 0;

  bool _isAscending = true;

  final int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;

  int get rowsPerPage => _rowsPerPage;
  int _rowsPerPageValue = 0;
  int get rowsPerPageValue => _rowsPerPageValue;

  int get sortColumnIndex => _sortColumnIndex;

  bool get isAscending => _isAscending;

  set setRowPerPageValue(int value) {
    _rowsPerPageValue = value;
  }

  set setSortColumnIndex(int value) {
    _sortColumnIndex = value;
  }

  set setIsAscending(bool value) {
    _isAscending = value;
  }

  void sort<T>(
      Comparable<T> Function(Map<String, dynamic> log) getField,
      int columnIndex,
      bool ascending,
      DashboardProvider provider,
      BuildContext context) {
    provider.setSortColumnIndex = columnIndex;
    provider.setIsAscending = ascending;
    final activityLogProvider = sortDashboard<T>(getField, ascending);
  }

  void sortDashboard<T>(
      Comparable<T> Function(Map<String, dynamic> log) getField,
      bool ascending) {
    _dashboardTopList.sort((a, b) {
      final aValue = getField(a);
      final bValue = getField(b);
      return ascending
          ? Comparable.compare(aValue, bValue)
          : Comparable.compare(bValue, aValue);
    });
    notifyListeners();
  }

  List<Map<String, dynamic>> get dashboardTopList => _dashboardTopList;
  final List<Map<String, dynamic>> _dashboardTopList = [
    {
      "user": "Teena Khan",
      "item": "4 Item",
      "last_order_revenue": "38000",
      "last_order_date": "7/12/2024",
      "total_revenue": "580000",
      "store": "Corporate\nGear"
    },
    {
      "user": "Teena Khan",
      "item": "0 Item",
      "last_order_revenue": "38000",
      "last_order_date": "10/12/2024",
      "total_revenue": "580000",
      "store": "Corporate\nGear"
    },
    {
      "user": "Teena Khan",
      "item": "0 Item",
      "last_order_revenue": "38000",
      "last_order_date": "08/12/2024",
      "total_revenue": "580000",
      "store": "Corporate\nGear"
    },
    {
      "user": "Teena Khan",
      "item": "0 Item",
      "last_order_revenue": "38000",
      "last_order_date": "01/12/2024",
      "total_revenue": "580000",
      "store": "Corporate\nGear"
    },
    {
      "user": "Teena Khan",
      "item": "0 Item",
      "last_order_revenue": "38000",
      "last_order_date": "09/12/2024",
      "total_revenue": "580000",
      "store": "Corporate\nGear"
    },
    {
      "user": "Teena Khan",
      "item": "2 Item",
      "last_order_revenue": "38000",
      "last_order_date": "15/12/2024",
      "total_revenue": "580000",
      "store": "Corporate\nGear"
    },
    {
      "user": "Teena Khan",
      "item": "3 Item",
      "last_order_revenue": "38000",
      "last_order_date": "01/12/2024",
      "total_revenue": "580000",
      "store": "Corporate\nGear"
    },
    {
      "user": "Teena Khan",
      "item": "5 Item",
      "last_order_revenue": "38000",
      "last_order_date": "20/12/2024",
      "total_revenue": "580000",
      "store": "Corporate\nGear"
    },
    {
      "user": "Teena Khan",
      "item": "1 Item",
      "last_order_revenue": "38000",
      "last_order_date": "22/12/2024",
      "total_revenue": "580000",
      "store": "Corporate\nGear"
    },
    {
      "user": "Teena Khan",
      "item": "4 Item",
      "last_order_revenue": "38000",
      "last_order_date": "19/12/2024",
      "total_revenue": "580000",
      "store": "Corporate\nGear"
    },

    // Add more data entries here
  ];

  //For graph

  int total = 100;
  int filled = 90;
  int empty = 10;

  DashboardProvider() {
    empty = total - filled;
  }

//Map

  LatLng _center =
      const LatLng(37.7749, -122.4194); // Default location (San Francisco)
  Set<Marker> _markers = {};
  GoogleMapController? _controller;

  LatLng get center => _center;
  Set<Marker> get markers => _markers;

  String _mapStyle = '';
  String get mapStyle => _mapStyle;
  void updateMapController(GoogleMapController controller) {
    _controller = controller;
    _setMapStyle();
  }

  void setCenter(LatLng newCenter) {
    _center = newCenter;
    notifyListeners();
  }

  void addMarker(LatLng position) {
    final marker = Marker(
      markerId: MarkerId(position.toString()),
      position: position,
    );
    _markers.add(marker);
    notifyListeners();
  }

  Future<void> _setMapStyle() async {
    if (_controller != null) {
      String style = await rootBundle.loadString('assets/map/map_style.json');
      _controller?.setMapStyle(style);
      _mapStyle = style;
      notifyListeners(); // Notify listeners to update the state if necessary
    }
  }
}
