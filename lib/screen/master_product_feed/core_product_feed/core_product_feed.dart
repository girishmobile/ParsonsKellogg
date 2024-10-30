import 'package:flutter/material.dart';
import 'package:parsonskellogg/core/color/color.dart';
import 'package:parsonskellogg/screen/master_product_feed/provider/product_database_provider.dart';
import 'package:parsonskellogg/widgets/product_listing_view.dart';
import 'package:parsonskellogg/widgets/product_searchbar.dart';
import 'package:parsonskellogg/widgets/toggle_topbar.dart';
import 'package:provider/provider.dart';

class CoreProductFeed extends StatelessWidget {
  const CoreProductFeed({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductDatabaseProvider>(context);
    final options = [
      'All',
      'Active',
      'InActive',
      'Draft',
      'Discontinued',
      'Synced with BC',
      'Resync with BC',
      'BC Sync Pending',
      'Color Discontinue'
    ];
    return Scaffold(
      backgroundColor: scafolledBgColor,
      body: ListView(
        children: [
          Builder(builder: (context) {
            return ProductSearchbar(
                prodProvider: provider,
                onChanged: (value) {
                  provider.searchByProductName(value);
                },
                onMoreFilter: () {
                  Scaffold.of(context).openEndDrawer();
                },
                title: 'Core Product Feed');
          }),
          ToggleTopbar(options: options, provider: provider),
          ProductListingView(provider: provider)
        ],
      ),
    );
  }
}
