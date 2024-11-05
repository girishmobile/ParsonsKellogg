import 'package:flutter/material.dart';
import 'package:parsonskellogg/core/color/color.dart';
import 'package:parsonskellogg/screen/master_product_feed/model/stores_model.dart';
import 'package:parsonskellogg/screen/master_product_feed/provider/store_provider.dart';
import 'package:parsonskellogg/widgets/store_listing_view.dart';
import 'package:parsonskellogg/widgets/store_searchbar.dart';
import 'package:provider/provider.dart';

class AllStores extends StatelessWidget {
  const AllStores({super.key});

  @override
  Widget build(BuildContext context) {
    final storeProvider = Provider.of<StoreProvider>(context);
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: scafolledBgColor,
      endDrawer: Container(
        width: screenSize.width * 0.7,
        color: Colors.white,
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: ListView(
                    children:
                        dummyStorefilterItems.asMap().entries.map((entry) {
                  int groupIndex = entry.key;
                  StorefilterModel item = entry.value;
                  return ExpansionTile(
                    title: Text(
                      item.title,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    iconColor: Colors.black.withOpacity(0.8),
                    backgroundColor: Colors.transparent,
                    children: item.filterItems.asMap().entries.map((entry) {
                      int index = entry.key;
                      final detail = entry.value;

                      if (detail == 'createdDate' || detail == 'updatedDate') {
                        return calendarWidget();
                      } else {
                        return ListTile(
                          leading: Checkbox(
                              activeColor: Colors.green.shade400,
                              value:
                                  true, //productProvider.checkboxStates[groupIndex]
                              //[index],
                              onChanged: (bool? value) {
                                // checkboxStates[groupIndex][index] =
                                //     value ?? false;
                                //productProvider.toggleCheckBox(
                                //  groupIndex, index, value ?? false);
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
                        // productProvider.clearCheckboxStates();
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
                          // final filterArray = productProvider.applyFilters();
                          //print(filterArray.map((item) => item.title).toList());
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
          Builder(
            builder: (context) {
              return StoreSearchbar(
                  title: 'Stores',
                  provider: storeProvider,
                  onMoreFilter: () {
                    print('more filter');
                  },
                  onChanged: (value) {
                    storeProvider.searchByProductName(value);
                  });
            },
          ),
          StoreListingView(
            provider: storeProvider,
          )
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
