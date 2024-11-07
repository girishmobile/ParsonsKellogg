import 'package:flutter/material.dart';
import 'package:parsonskellogg/core/color/color.dart';
import 'package:parsonskellogg/screen/master_product_feed/dummy_data.dart';
import 'package:parsonskellogg/screen/master_product_feed/model/master_feed_model.dart';
import 'package:parsonskellogg/widgets/store_builder_feed.dart';
import 'package:parsonskellogg/widgets/store_builder_searchbar.dart';
import 'package:parsonskellogg/widgets/store_gridview.dart';
import 'package:parsonskellogg/widgets/storebuilder_table.dart';

class StoreBuilder extends StatelessWidget {
  const StoreBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scafolledBgColor,
      body: ListView(
        children: [
          const StorebuilderTable(
              title: 'Store Builder', tableData: simpleStore),
          const StoreGridview(title: 'Store Builder', storeList: storeBuilder),
          StoreBuilderFeed(
            title: 'Corporate Builder',
            storeBuilFeedData: dummyStoreBuilderFeed,
          ),
          const StoreBuilderSearchbar(
            title: 'Store Builder Stores',
          ),
        ],
      ),
    );
  }
}
