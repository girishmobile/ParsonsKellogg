import 'package:flutter/material.dart';
import 'package:parsonskellogg/core/color/color.dart';
import 'package:parsonskellogg/screen/master_product_feed/dummy_data.dart';
import 'package:parsonskellogg/screen/master_product_feed/model/master_feed_model.dart';
import 'package:parsonskellogg/widgets/master_product_feed.dart';
import 'package:parsonskellogg/widgets/store_gridview.dart';
import 'package:parsonskellogg/widgets/store_table.dart';
import 'package:parsonskellogg/widgets/storebuilder_table.dart';

class StoreDashboardScreen extends StatelessWidget {
  const StoreDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scafolledBgColor,
      body: ListView(
        children: [
          const StoreTable(title: 'Ecommerce', tableData: productDatabase),
          const StoreTable(
              title: 'Corporate Store', tableData: productDatabase),
          const StorebuilderTable(
              title: 'Store Builder', tableData: simpleStore),
          const StorebuilderTable(
              title: 'Form Builder', tableData: simpleStore),
          const StoreGridview(title: 'Ecommerce', storeList: ecommerceStore),
          const StoreGridview(
              title: 'Corporate Store', storeList: corporateStore),
          const StoreGridview(title: 'Store Builder', storeList: storeBuilder),
          const StoreGridview(title: 'Form Builder', storeList: formBuilder),
          MasterProductFeed(
              masterFeedsArry: masterFeedsData, title: 'Master Product Feed')
        ],
      ),
    );
  }
}
