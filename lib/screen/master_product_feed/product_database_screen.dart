import 'package:flutter/material.dart';
import 'package:parsonskellogg/core/component/component.dart';
import 'package:parsonskellogg/core/image_path/image_path.dart';
import 'package:intl/intl.dart';
import 'package:parsonskellogg/screen/master_product_feed/model/filter_product_model.dart';
import 'package:parsonskellogg/screen/master_product_feed/provider/product_database_provider.dart';
import 'package:parsonskellogg/screen/master_product_feed/widgets/simple_searchbar.dart';
import 'package:provider/provider.dart';

// class Item {
//   final String title;
//   final List<String> details;
//   Item(this.title, this.details);
// }

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

    //List to hold checked state, initilized directly in the widget
    // late List<List<bool>> checkboxStates;

    // checkboxStates = List.generate(filterItems.length,
    //     (i) => List.filled(filterItems[i].details.length, false));

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
              prodProvider: productProvider,
              onChanged: (value) {
                productProvider.searchByProductName(value);
              },
              onMoreFilter: () {
                Scaffold.of(context).openEndDrawer();
              },
            );
          }),
          _toggleButtonExample(productProvider, options),
          _productListView(context, productProvider),
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

  _toggleButtonExample(
    ProductDatabaseProvider provider,
    List<String> options,
  ) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: ToggleButtons(
        isSelected: options
            .asMap()
            .entries
            .map((entry) => entry.key == provider.selectedIndex)
            .toList(),
        borderRadius: BorderRadius.circular(4), // Border radius
        borderColor: Colors.grey, // Border color
        selectedBorderColor: Colors.grey, // Color when selected
        selectedColor: Colors.black, // Text color when selected
        color: Colors.grey, // Default text color
        fillColor:
            const Color.fromRGBO(238, 243, 248, 1), // Fill color when selected
        constraints: const BoxConstraints(
          minWidth: 80, // Minimum width for buttons
          minHeight: 50, // Minimum height for buttons
        ),
        onPressed: (index) {
          provider.clearSearchText();
          provider.toggleSelection(index); // Use provider to toggle selection
          //Define a list of statues corresponding to each index
          const statues = ['All', 'Active', 'InActive', 'Draft'];
          //Ensure the index is whinn bounds and filter according
          if (index >= 0 && index < statues.length) {
            provider.filterByStatus(statues[index]);
          }
        },
        children: options.map((option) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(option),
          );
        }).toList(),
      ),
    );
  }

  _productListView(context, ProductDatabaseProvider provider) {
    int defaultRowsPerPage = 20; // Default rows per page

    const arrowUpward = Icons.arrow_upward_outlined;
    const arrowDownward = Icons.arrow_downward_outlined;
    if (provider.products.isEmpty) {
      return Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: const Text('No data found as of now..'),
        ),
      );
    }
    return Theme(
      data: Theme.of(context).copyWith(
        cardTheme: const CardTheme(
          elevation: 0,
          margin: EdgeInsets.zero,
          color: Colors.white,
        ),
      ),
      child: SingleChildScrollView(
        child: PaginatedDataTable(
          showEmptyRows: false,
          dataRowMaxHeight: 65,
          columnSpacing: 36,
          showCheckboxColumn: true,
          sortAscending: true,
          columns: [
            DataColumn(label: commonColText(text: 'IMAGE')),
            DataColumn(
                label: Row(
                  children: [
                    commonColText(text: 'PRODUCT NAME'),
                    const SizedBox(width: 10),
                    Icon(
                      provider.sortAscending ? arrowUpward : arrowDownward,
                    )
                  ],
                ),
                onSort: (columnIndex, ascending) {
                  provider.sortByName();
                }),
            DataColumn(
                label: Row(
                  children: [
                    commonColText(text: 'BRAND NAME'),
                    const SizedBox(width: 10),
                    Icon(
                      provider.sortBrandAscending ? arrowUpward : arrowDownward,
                    ),
                  ],
                ),
                onSort: (columnIndex, ascending) {
                  provider.sortBrandByName();
                }),
            DataColumn(
              label: Row(
                children: [
                  commonColText(text: 'VENDOR NAME'),
                  const SizedBox(width: 10),
                  Icon(
                    provider.sortVendorAscending ? arrowUpward : arrowDownward,
                  )
                ],
              ),
              onSort: (columnIndex, ascending) {
                provider.sortByVendorName();
              },
            ),
            DataColumn(
                label: Row(
                  children: [
                    commonColText(text: 'OUR COST'),
                    const SizedBox(width: 10),
                    Icon(provider.sortOurCostAscending
                        ? arrowUpward
                        : arrowDownward),
                  ],
                ),
                onSort: (columnIndex, ascending) {
                  provider.sortByOurCost();
                }),
            DataColumn(
              label: Row(
                children: [
                  commonColText(text: 'SALE PRICE'),
                  const SizedBox(width: 10),
                  Icon(
                    provider.sortSalePriceAscend ? arrowUpward : arrowDownward,
                  )
                ],
              ),
              onSort: (columnIndex, ascending) {
                provider.sortBySalePrice();
              },
            ),
            DataColumn(
              label: Row(
                children: [
                  Row(
                    children: [
                      commonColText(text: 'CREATED DATE'),
                      const SizedBox(width: 10),
                      Icon(provider.sortCreatedDateAsce
                          ? arrowUpward
                          : arrowDownward)
                    ],
                  ),
                ],
              ),
              onSort: (columnIndex, ascending) {
                provider.sortByCreatedDate();
              },
            ),
            DataColumn(
              label: Row(
                children: [
                  commonColText(text: 'CREATED BY'),
                  const SizedBox(width: 10),
                  Icon(provider.sortCreatedByAsce ? arrowUpward : arrowDownward)
                ],
              ),
              onSort: (columnIndex, ascending) {
                provider.sortByCreatedName();
              },
            ),
            DataColumn(
              label: Row(
                children: [
                  commonColText(text: 'UPDATED DATE'),
                  const SizedBox(width: 10),
                  Icon(provider.sortUpdatedDateAsce
                      ? arrowUpward
                      : arrowDownward)
                ],
              ),
              onSort: (columnIndex, ascending) {
                provider.sortByUpdatedDate();
              },
            ),
            DataColumn(
              label: Row(
                children: [
                  commonColText(text: 'UPDATED BY'),
                  const SizedBox(width: 10),
                  Icon(provider.sortUpdatedNameAsce
                      ? arrowUpward
                      : arrowDownward)
                ],
              ),
              onSort: (columnIndex, ascending) {
                provider.sortByUpdatedName();
              },
            ),
            DataColumn(
              label: Row(
                children: [
                  commonColText(text: 'STATUS'),
                  const SizedBox(width: 10),
                  Icon(provider.sortStatusAscending
                      ? arrowUpward
                      : arrowDownward)
                ],
              ),
              onSort: (columnIndex, ascending) {
                provider.sortByStatus();
              },
            )
          ],
          source: UserDataSource(produtProvider: provider, context: context),
          rowsPerPage: provider.products.length < defaultRowsPerPage
              ? provider.products.length
              : defaultRowsPerPage,
        ),
      ),
    );
  }
}

class UserDataSource extends DataTableSource {
  UserDataSource({required this.produtProvider, required this.context});

  final ProductDatabaseProvider produtProvider;
  final BuildContext context;

  @override
  DataRow getRow(int index) {
    // final prodcuct = dummyProductList[index];
    final prodcuct = produtProvider.products[index];

    final cretedDateformatted =
        DateFormat('dd/MM/yyyy').format(prodcuct.creadtedDate);
    final cretedTimeformatted =
        DateFormat('hh:mm a').format(prodcuct.creadtedDate);
    // Format the date
    final updatedDateformatted = prodcuct.updatedDate != null
        ? DateFormat('dd/MM/yyyy').format(prodcuct.updatedDate!)
        : '';
    final updatedTimeformatted = prodcuct.updatedDate != null
        ? DateFormat('hh:mm a').format(prodcuct.updatedDate!)
        : '';
    Color statusColor = Colors.grey;
    final status = prodcuct.status;
    switch (status) {
      case 'Draft':
        statusColor = Colors.blue;
        break;
      case 'Active':
        statusColor = Colors.green;
      case 'InActive':
        statusColor = Colors.red;
      default:
    }
    return DataRow(cells: [
      DataCell(
        SizedBox(
          height: 60,
          width: 60,
          child: Image.asset(
            iclogoCirlce,
            width: 60,
            height: 60,
            fit: BoxFit.contain,
          ),
        ),
      ),
      DataCell(Text(
        prodcuct.productName,
        style: Theme.of(context).textTheme.titleMedium,
      )),
      DataCell(Text(prodcuct.brandName,
          style: Theme.of(context).textTheme.titleMedium)),
      DataCell(Text(prodcuct.vendorName,
          style: Theme.of(context).textTheme.titleMedium)),
      DataCell(Text(prodcuct.ourCost.toString(),
          style: Theme.of(context).textTheme.titleMedium)),
      DataCell(Text(prodcuct.salePrice.toString(),
          style: Theme.of(context).textTheme.titleMedium)),
      DataCell(
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(cretedDateformatted,
                style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 3),
            Text(
              cretedTimeformatted,
              style: TextStyle(
                color: Colors.grey.withOpacity(0.7),
                fontSize: 12,
              ),
            )
          ],
        ),
      ),
      DataCell(Text(prodcuct.createdBy)),
      DataCell(
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(updatedDateformatted,
                style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 3),
            Text(
              updatedTimeformatted,
              style: TextStyle(
                color: Colors.grey.withOpacity(0.7),
                fontSize: 12,
              ),
            )
          ],
        ),
      ),
      DataCell(Text(prodcuct.updatedBy ?? '',
          style: Theme.of(context).textTheme.titleMedium)),
      DataCell(Container(
        //color: statusColor.withOpacity(0.3),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: statusColor.withOpacity(0.3),
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            width: 1,
            color: statusColor.withOpacity(0.3),
          ),
        ),
        child: Text(
          prodcuct.status,
          style: TextStyle(
            color: statusColor,
            fontSize: 11,
          ),
        ),
      )),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => produtProvider.products.length;

  @override
  int get selectedRowCount => 0;

  int get rowCountApproximate => rowCount;
}

class User {
  final int id;
  final String name;
  final String email;

  User({required this.id, required this.name, required this.email});
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
