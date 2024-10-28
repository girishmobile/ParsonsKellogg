import 'package:flutter/material.dart';
import 'package:parsonskellogg/core/component/component.dart';
import 'package:parsonskellogg/core/image_path/image_path.dart';
import 'package:intl/intl.dart';
import 'package:parsonskellogg/screen/master_product_feed/model/filter_product_model.dart';
import 'package:parsonskellogg/screen/master_product_feed/provider/product_database_provider.dart';
import 'package:parsonskellogg/screen/master_product_feed/widgets/product_listing_view.dart';
import 'package:parsonskellogg/screen/master_product_feed/widgets/simple_searchbar.dart';
import 'package:parsonskellogg/screen/master_product_feed/widgets/toggle_topbar.dart';
import 'package:provider/provider.dart';

// class Item {
//   final String title;
//   final List<String> details;
//   Item(this.title, this.details);
// }
///jljlkjkljlkjl
class ProductDatabaseScreen extends StatelessWidget {
  const ProductDatabaseScreen({super.key});

  Future<void> selectedDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context, firstDate: DateTime(2000), lastDate: DateTime.now());
    if (picked != null && picked != DateTime.now()) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Selected date:  ${picked.toLocal()}")));
    }
  }

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductDatabaseProvider>(context);
    final List<String> options = ['All', 'Active', 'Inactive', 'Draft'];
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(238, 243, 248, 1),
      endDrawer: Container(
        width: screenSize.width * 0.7,
        color: Colors.white,
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: ListView(
                    children: filterItems.asMap().entries.map((entry) {
                  int groupIndex = entry.key;
                  FilterItemModel item = entry.value;
                  return ExpansionTile(
                    title: Text(
                      item.title,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    iconColor: Colors.black.withOpacity(0.8),
                    backgroundColor: Colors.transparent,
                    children: item.details.asMap().entries.map((entry) {
                      int index = entry.key;
                      final detail = entry.value;

                      if (detail == 'createdDate' || detail == 'updatedDate') {
                        return calendarWidget();
                      } else {
                        return ListTile(
                          leading: Checkbox(
                              activeColor: Colors.green.shade400,
                              value: productProvider.checkboxStates[groupIndex]
                                  [index],
                              onChanged: (bool? value) {
                                // checkboxStates[groupIndex][index] =
                                //     value ?? false;
                                productProvider.toggleCheckBox(
                                    groupIndex, index, value ?? false);
                              }),
                          title: Text(detail,
                              textAlign: TextAlign.left,
                              style: Theme.of(context).textTheme.titleMedium),
                        );
                      }
                    }).toList(),
                  );
                }).toList()),
              ),
              SizedBox(
                height: 0,
                child: Divider(
                  thickness: 0.5,
                  color: Colors.grey.shade400,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        productProvider.clearCheckboxStates();
                      },
                      child: Text(
                        'Clear',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                fontSize: 14, color: Colors.grey.shade800),
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          final filterArray = productProvider.applyFilters();
                          print(filterArray.map((item) => item.title).toList());
                        },
                        child: const Text('Apply'))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      body: ListView(
        children: [
          Builder(builder: (context) {
            return SimpleSearchbar(
              title: 'Produt Database',
              prodProvider: productProvider,
              onChanged: (value) {
                productProvider.searchByProductName(value);
              },
              onMoreFilter: () {
                Scaffold.of(context).openEndDrawer();
              },
            );
          }),
          ToggleTopbar(options: options, provider: productProvider),
          ProductListingView(provider: productProvider),
        ],
      ),
    );
  }

  Widget calendarWidget() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            width: 0.75,
            color: Colors.black.withOpacity(0.5),
          )),
      margin: const EdgeInsets.only(bottom: 16, left: 16, right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Select Date',
          ),
          Icon(
            Icons.calendar_month_outlined,
            color: Colors.black.withOpacity(0.5),
          )
        ],
      ),
    );
  }
}


/**
 /**
 * Scaffold(
        backgroundColor: const Color.fromRGBO(238, 243, 248, 1),
        body: Consumer<ProductDatabaseProvider>(
          builder: (context, provider, child) => ListView(
            children: [
              SimpleSearchbar(seachTextController: searchController),
              _toggleButtonExample(provider, options),
              _productListView(context, provider),
            ],
          ),
        ),
        );
 */
 */
