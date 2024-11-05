import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:parsonskellogg/core/image_path/image_path.dart';
import 'package:parsonskellogg/core/string_utils/string_utils.dart';

import 'package:parsonskellogg/screen/master_product_feed/provider/store_provider.dart';

class StoreDataSource extends DataTableSource {
  StoreDataSource({required this.storeProvider, required this.context});

  final StoreProvider storeProvider;
  final BuildContext context;

  @override
  DataRow? getRow(int index) {
    // final prodcuct = dummyProductList[index];
    final store = storeProvider.stores[index];

    final cretedDateformatted =
        DateFormat('dd/MM/yyyy').format(store.createdDate);
    final cretedTimeformatted = DateFormat('hh:mm a').format(store.createdDate);
    // Format the date
    final updatedDateformatted = store.updatedDate != null
        ? DateFormat('dd/MM/yyyy').format(store.updatedDate!)
        : '';
    final updatedTimeformatted = store.updatedDate != null
        ? DateFormat('hh:mm a').format(store.updatedDate!)
        : '';
    Color statusColor = Colors.grey;
    final status = store.status;
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
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.withOpacity(0.5))),
            child: Image.asset(
              height: 90,
              width: 120,
              icLoginLogo,
              fit: BoxFit.contain,
            ),
          ),
        ),
        DataCell(Container(
          constraints: const BoxConstraints(maxWidth: 120),
          child: Text(
            store.storeName,
            maxLines: 2,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        )),
        DataCell(Text(store.storeType,
            style: Theme.of(context).textTheme.titleMedium)),
        DataCell(Text(store.numOfProduct.toString(),
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
        DataCell(Text(store.createdBy)),
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
        DataCell(Text(store.updatedBy ?? '',
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
            store.status,
            style: TextStyle(
              color: statusColor,
              fontSize: 11,
            ),
          ),
        )),
        DataCell(Container(
          constraints: const BoxConstraints(maxWidth: 90),
          child: Text(
            store.action,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: const Color.fromRGBO(92, 87, 238, 1)),
          ),
        )),
      ],
    );
    ;
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => storeProvider.stores.length;

  @override
  int get selectedRowCount => 0;

  int get rowCountApproximate => rowCount;
}
