import 'package:flutter/material.dart';
import 'package:parsonskellogg/core/color/color.dart';
import 'package:parsonskellogg/screen/master_product_feed/dummy_data.dart';
import 'package:parsonskellogg/screen/master_product_feed/model/master_feed_model.dart';
import 'package:parsonskellogg/widgets/store_gridview.dart';
import 'package:parsonskellogg/widgets/store_product_feed.dart';
import 'package:parsonskellogg/widgets/store_table.dart';

class EcommerceStore extends StatelessWidget {
  const EcommerceStore({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scafolledBgColor,
      body: ListView(
        children: [
          const StoreTable(title: 'Ecommerce', tableData: productDatabase),
          const StoreGridview(title: 'Ecommerce', storeList: ecommerceStore),
          StoreProductFeed(
            title: 'Ecommerce',
            storeFeedData: dummyStoreProduct,
          ),
        ],
      ),
    );
  }
}
