import 'package:flutter/material.dart';
import 'package:parsonskellogg/core/component/component.dart';
import 'package:parsonskellogg/screen/master_product_feed/provider/product_database_provider.dart';
import 'package:parsonskellogg/screen/master_product_feed/widgets/product_data_source.dart';

class ProductListingView extends StatelessWidget {
  const ProductListingView({super.key, required this.provider});
  final ProductDatabaseProvider provider;
  @override
  Widget build(BuildContext context) {
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
          source: ProductDataSource(context: context, produtProvider: provider),
          rowsPerPage: provider.products.length < defaultRowsPerPage
              ? provider.products.length
              : defaultRowsPerPage,
        ),
      ),
    );
  }
}
