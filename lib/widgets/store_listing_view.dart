import 'package:flutter/material.dart';
import 'package:parsonskellogg/core/component/component.dart';
import 'package:parsonskellogg/screen/master_product_feed/provider/store_provider.dart';
import 'package:parsonskellogg/widgets/store_data_source.dart';

class StoreListingView extends StatelessWidget {
  const StoreListingView({super.key, required this.provider});

  final StoreProvider provider;

  @override
  Widget build(BuildContext context) {
    int defaultRowsPerPage = 20; // Default rows per page
    const arrowUpward = Icons.arrow_upward_outlined;
    const arrowDownward = Icons.arrow_downward_outlined;

    if (provider.stores.isEmpty) {
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
          dataRowMaxHeight: 120,
          columnSpacing: 36,
          showCheckboxColumn: true,
          sortAscending: true,
          columns: [
            DataColumn(label: commonColText(text: 'IMAGE')),
            DataColumn(
                label: Row(children: [
                  commonColText(text: 'STORE NAME'),
                  const SizedBox(width: 10),
                  Icon(
                    provider.sortAscending ? arrowUpward : arrowDownward,
                  )
                ]),
                onSort: (columnIndex, ascending) {
                  provider.sortByName();
                }),
            DataColumn(
                label: Row(children: [
                  commonColText(text: 'STORE TYPE'),
                  const SizedBox(width: 10),
                  Icon(
                    provider.sortAstoreType ? arrowUpward : arrowDownward,
                  ),
                ]),
                onSort: (columnIndex, ascending) {
                  provider.sortByStoreName();
                }),
            DataColumn(
              label: Row(
                children: [
                  commonColText(text: '#OF PRODUCTS'),
                  const SizedBox(width: 10),
                  Icon(
                    provider.sortAsceCount ? arrowUpward : arrowDownward,
                  )
                ],
              ),
              onSort: (columnIndex, ascending) {
                provider.sortByNumberOfProducts();
              },
            ),
            DataColumn(
                label: Row(
                  children: [
                    commonColText(text: 'CREATED DATE'),
                    const SizedBox(width: 10),
                    Icon(
                        provider.sortAsceCreated ? arrowUpward : arrowDownward),
                  ],
                ),
                onSort: (columnIndex, ascending) {
                  provider.sortByCreatedDate();
                }),
            DataColumn(
              label: Row(
                children: [
                  commonColText(text: 'CREATED BY'),
                  const SizedBox(width: 10),
                  Icon(
                    provider.sortAsceCreateName ? arrowUpward : arrowDownward,
                  )
                ],
              ),
              onSort: (columnIndex, ascending) {
                provider.sortByCreateName();
              },
            ),
            DataColumn(
              label: Row(
                children: [
                  Row(
                    children: [
                      commonColText(text: 'UPDATED DATE'),
                      const SizedBox(width: 10),
                      Icon(provider.sortAsceUpdated
                          ? arrowUpward
                          : arrowDownward)
                    ],
                  ),
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
                  Icon(
                      provider.sortAsceUpdateName ? arrowUpward : arrowDownward)
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
            ),
            DataColumn(
              label: Row(
                children: [
                  commonColText(text: 'ACTION'),
                  //const SizedBox(width: 10),
                  //Icon(provider.sortAscending ? arrowUpward : arrowDownward)
                ],
              ),
              // onSort: (columnIndex, ascending) {
              //   //provider.sortByUpdatedName();
              // },
            ),
          ],
          source: StoreDataSource(storeProvider: provider, context: context),
          rowsPerPage: provider.stores.length < defaultRowsPerPage
              ? provider.stores.length
              : defaultRowsPerPage,
        ),
      ),
    );
  }
}
