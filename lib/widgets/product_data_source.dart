import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:parsonskellogg/core/image_path/image_path.dart';

import 'package:parsonskellogg/screen/master_product_feed/provider/product_database_provider.dart';

class ProductDataSource extends DataTableSource {
  ProductDataSource({required this.context, required this.produtProvider});

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
    return DataRow(
      cells: [
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
        DataCell(Container(
          constraints: const BoxConstraints(maxWidth: 120),
          child: Text(
            prodcuct.productName,
            style: Theme.of(context).textTheme.titleMedium,
          ),
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
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => produtProvider.products.length;

  @override
  int get selectedRowCount => 0;

  int get rowCountApproximate => rowCount;
}
