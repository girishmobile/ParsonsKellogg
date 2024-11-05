import 'package:flutter/cupertino.dart';

class Order{
  String? title;
  String? price;
  Order({this.title,this.price});
}
class OrderProvider with ChangeNotifier{


  List<Order> orderList=[
    Order(title: "Total Orders",price: "1"),
    Order(title: "Total Sales",price: "818.00"),
    Order(title: "Average Sales",price: "818.00"),
    Order(title: "Coupons Used",price: "0.00"),
  ];

  List<Order> orderList1=[
    Order(title: "Total Orders By Status",price: ""),
    Order(title: "Top Coupons",price: "818.00"),
    Order(title: "Paying Customer Vs Non-Paying Customer",price: "818.00"),
  ];

  List<Order> orderListTable=[
    Order(title: "Corporate Gear",price: "568"),
    Order(title: "Corporate Gear1",price: "818.00"),
    Order(title: "Corporate Gear2",price: "452.00"),
    Order(title: "Corporate Gear4",price: "786.00"),
  ];

  final List<Map<String, dynamic>> customerOrderList = [
    {
      "user": "Tejas Daftary",
      "order_no": "#12",
      "order_note": "This is test order to check email template from beta.",
      "order_cancel": "",
      "total_team": "1",
      "sub_total": "786.00",
      "total": "818.00",
      "order_date": "11/05/2024",
      "order_tiem": "01:20 AM",
    },
    {
      "user": "jatin devaiya",
      "order_no": "#13",
      "order_note": "",
      "order_cancel": "",
      "total_team": "1",
      "sub_total": "87.00",
      "total": "",
      "order_date": "10/23/2024",
      "order_tiem": "02:42 AM",
    },
    {
      "user": "Kailash Kumar",
      "order_no": "#14",
      "order_note": "test",
      "order_cancel": "",
      "total_team": "3",
      "sub_total": "4421.00",
      "total": "4578.00",
      "order_date": "11/05/2024",
      "order_tiem": "01:20 AM",
    },
    {
      "user": "Tejas Daftary",
      "order_no": "#12",
      "order_note": "This is test order to check email template from beta.",
      "order_cancel": "",
      "total_team": "1",
      "sub_total": "786.00",
      "total": "818.00",
      "order_date": "11/05/2024",
      "order_tiem": "01:20 AM",
    },
    {
      "user": "jatin devaiya",
      "order_no": "#13",
      "order_note": "",
      "order_cancel": "",
      "total_team": "1",
      "sub_total": "87.00",
      "total": "",
      "order_date": "10/23/2024",
      "order_tiem": "02:42 AM",
    },
    {
      "user": "Kailash Kumar",
      "order_no": "#14",
      "order_note": "test",
      "order_cancel": "",
      "total_team": "3",
      "sub_total": "4421.00",
      "total": "4578.00",
      "order_date": "11/05/2024",
      "order_tiem": "01:20 AM",
    },
    {
      "user": "Tejas Daftary",
      "order_no": "#12",
      "order_note": "This is test order to check email template from beta.",
      "order_cancel": "",
      "total_team": "1",
      "sub_total": "786.00",
      "total": "818.00",
      "order_date": "11/05/2024",
      "order_tiem": "01:20 AM",
    },
    {
      "user": "jatin devaiya",
      "order_no": "#13",
      "order_note": "",
      "order_cancel": "",
      "total_team": "1",
      "sub_total": "87.00",
      "total": "",
      "order_date": "10/23/2024",
      "order_tiem": "02:42 AM",
    },
    {
      "user": "Kailash Kumar",
      "order_no": "#14",
      "order_note": "test",
      "order_cancel": "",
      "total_team": "3",
      "sub_total": "4421.00",
      "total": "4578.00",
      "order_date": "11/05/2024",
      "order_tiem": "01:20 AM",
    },

    // Add more data entries here
  ];

  final List<Map<String, dynamic>> customerOrderChartList = [
    {
      'category': 'Total Orders',
      'value': 100,
      'color': const Color.fromRGBO(134, 239, 172, 1)
    },
    {
      'category': 'Complete Orders',
      'value': 0,
      'color': const Color.fromRGBO(38, 60, 255, 1)
    },
    {
      'category': 'Cancelled Orders',
      'value': 0,
      'color': const Color.fromRGBO(181, 190, 204, 1.0)
    },
  ];

  final List<Map<String, dynamic>> orderSaleChart = [
    {
      'category': 'Total Orders',
      'value': 50,
      'color': const Color.fromRGBO(134, 239, 172, 1)
    },
    {
      'category': 'Complete Orders',
      'value': 0,
      'color': const Color.fromRGBO(38, 60, 255, 1)
    },
    {
      'category': 'Not Synced Order',
      'value': 50,
      'color': const Color.fromRGBO(181, 190, 204, 1.0)
    },
  ];


  final List<Map<String, dynamic>> orderStoreChart = [
    {
      'category': 'eCommerce Store',
      'value': 100,
      'color': const Color.fromRGBO(134, 239, 172, 1)
    },

  ];

  final List<Map<String, dynamic>> orderTopFiveChart = [
    {
      'category': 'Peter Millar Men Iron / White Perth Mini-Stripe Stretch Loop Terry Quarter- Zip',
      'value': 100,
      'color': const Color.fromRGBO(134, 239, 172, 1)
    },
    {
      'category': 'FootJoy Men Red / White Classic Stripe Polo',
      'value': 100,
      'color': const Color.fromRGBO(38, 60, 255, 1)
    },
    {
      'category': 'Helly Hansen Women Navy Daybreaker Fleece',
      'value': 100,
      'color': const Color.fromRGBO(181, 190, 204, 1.0)
    },

  ];



  final List<Map<String, dynamic>> customerUncapturedList = [
    {
      "store_name": "Corporate Gear",
      "order_no": "#1635069",
      "customer_name": "testtest",
      "email": "prem@redefinesolutions.com",
      "total_team": "1",
      "order_total": "2125.00",
      "status": "new",
      "order_date": "11/05/2024",
      "order_tiem": "01:49 AM",
    },
    {
      "store_name": "Corporate Gear",
      "order_no": "#1635069",
      "customer_name": "testtest",
      "email": "prem@redefinesolutions.com",
      "total_team": "1",
      "order_total": "2125.00",
      "status": "new",
      "order_date": "11/05/2024",
      "order_tiem": "01:49 AM",
    },
    {
      "store_name": "Corporate Gear",
      "order_no": "#1635069",
      "customer_name": "testtest",
      "email": "prem@redefinesolutions.com",
      "total_team": "1",
      "order_total": "2125.00",
      "status": "new",
      "order_date": "11/05/2024",
      "order_tiem": "01:49 AM",
    },
    {
      "store_name": "Corporate Gear",
      "order_no": "#1635069",
      "customer_name": "testtest",
      "email": "prem@redefinesolutions.com",
      "total_team": "1",
      "order_total": "2125.00",
      "status": "new",
      "order_date": "11/05/2024",
      "order_tiem": "01:49 AM",
    },
    {
      "store_name": "Corporate Gear",
      "order_no": "#1635069",
      "customer_name": "testtest",
      "email": "prem@redefinesolutions.com",
      "total_team": "1",
      "order_total": "2125.00",
      "status": "new",
      "order_date": "11/05/2024",
      "order_tiem": "01:49 AM",
    }, {
      "store_name": "Corporate Gear",
      "order_no": "#1635069",
      "customer_name": "testtest",
      "email": "prem@redefinesolutions.com",
      "total_team": "1",
      "order_total": "2125.00",
      "status": "new",
      "order_date": "11/05/2024",
      "order_tiem": "01:49 AM",
    }, {
      "store_name": "Corporate Gear",
      "order_no": "#1635069",
      "customer_name": "testtest",
      "email": "prem@redefinesolutions.com",
      "total_team": "1",
      "order_total": "2125.00",
      "status": "new",
      "order_date": "11/05/2024",
      "order_tiem": "01:49 AM",
    }, {
      "store_name": "Corporate Gear",
      "order_no": "#1635069",
      "customer_name": "testtest",
      "email": "prem@redefinesolutions.com",
      "total_team": "1",
      "order_total": "2125.00",
      "status": "new",
      "order_date": "11/05/2024",
      "order_tiem": "01:49 AM",
    },



    // Add more data entries here
  ];

  final List<Map<String, dynamic>> customerListCustomerAndEMp = [
    {
      "store_name": "Corporate Gear",
      "customer_name": "testtest",
      "email": "prem@redefinesolutions.com",
      "total_orders":"3",
      "order_total": "3911.00",

    },
    {
      "store_name": "Corporate Gear",
      "customer_name": "testtest",
      "email": "prem@redefinesolutions.com",
      "total_orders":"3",
      "order_total": "3911.00",

    },
    {
      "store_name": "Corporate Gear",
      "customer_name": "testtest",
      "email": "prem@redefinesolutions.com",
      "total_orders":"3",
      "order_total": "3911.00",

    },
    {
      "store_name": "Corporate Gear",
      "customer_name": "testtest",
      "email": "prem@redefinesolutions.com",
      "total_orders":"3",
      "order_total": "3911.00",

    },
    {
      "store_name": "Corporate Gear",
      "customer_name": "testtest",
      "email": "prem@redefinesolutions.com",
      "total_orders":"3",
      "order_total": "3911.00",

    },
    {
      "store_name": "Corporate Gear",
      "customer_name": "testtest",
      "email": "prem@redefinesolutions.com",
      "total_orders":"3",
      "order_total": "3911.00",

    },
    {
      "store_name": "Corporate Gear",
      "customer_name": "testtest",
      "email": "prem@redefinesolutions.com",
      "total_orders":"3",
      "order_total": "3911.00",

    },


    // Add more data entries here
  ];
  final List<Map<String, dynamic>> orderDraftList = [
    {
      "store_name": "Corporate Gear",
      "store_type": "eCommerce Store",
      "image": "https://storagemedia.corporategear.com/betastoragemedia/1/store/logo_5.svg",
    },
    {
      "store_name": "Corporate Gear",
      "store_type": "eCommerce Store",
      "image": "https://storagemedia.corporategear.com/betastoragemedia/1/store/logo_5.svg",
    },
    {
      "store_name": "Corporate Gear",
      "store_type": "Corporate Store",
      "image": "https://storagemedia.corporategear.com/betastoragemedia/1/store/logo_5.svg",
    },
    {
      "store_name": "Corporate Gear",
      "store_type": "eCommerce Store",
      "image": "https://storagemedia.corporategear.com/betastoragemedia/1/store/logo_5.svg",
    },
    {
      "store_name": "Corporate Gear",
      "store_type": "Corporate Store",
      "image": "https://storagemedia.corporategear.com/betastoragemedia/1/store/logo_5.svg",
    },
    {
      "store_name": "Corporate Gear",
      "store_type": "eCommerce Store",
      "image": "https://storagemedia.corporategear.com/betastoragemedia/1/store/logo_5.svg",
    },
    {
      "store_name": "Corporate Gear",
      "store_type": "eCommerce Store",
      "image": "https://storagemedia.corporategear.com/betastoragemedia/1/store/logo_5.svg",
    },
    {
      "store_name": "Corporate Gear",
      "store_type": "eCommerce Store",
      "image": "https://storagemedia.corporategear.com/betastoragemedia/1/store/logo_5.svg",
    }, {
      "store_name": "Corporate Gear",
      "store_type": "eCommerce Store",
      "image": "https://storagemedia.corporategear.com/betastoragemedia/1/store/logo_5.svg",
    },
    {
      "store_name": "Corporate Gear",
      "store_type": "Corporate Store",
      "image": "https://storagemedia.corporategear.com/betastoragemedia/1/store/logo_5.svg",
    },


    // Add more data entries here
  ];
}
