import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:parsonskellogg/core/color/color.dart';
import 'package:parsonskellogg/core/common/common_table_view.dart';
import 'package:parsonskellogg/core/component/component.dart';
import 'package:parsonskellogg/provider/order_provider.dart';
import 'package:provider/provider.dart';

class OrderListCommonPage extends StatelessWidget {
  const OrderListCommonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return commonCardView(
        child: Consumer<OrderProvider>(builder: (context, provider, child) {
      return SizedBox(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        child: ListView(
          shrinkWrap: true,
          primary: false,
          children: [
            CommonTableView(
                rowsPerPage: provider.orderDraftList.length,
                columns: [
                  DataColumn(
                      label: commonColText(
                          colorText: Colors.grey,
                          text: "Order Status".toUpperCase())),
                  DataColumn(
                      label: commonColText(
                          colorText: Colors.grey, text: "Bc Status".toUpperCase())),
                  DataColumn(
                      label: commonColText(
                          colorText: Colors.grey, text: "Order".toUpperCase())),
                  DataColumn(
                      label: commonColText(
                          colorText: Colors.grey,
                          text: "Store Name".toUpperCase())),
                  DataColumn(
                      label: commonColText(
                          colorText: Colors.grey,
                          text: "Customer Billing Name / Zipcode".toUpperCase())),
                  DataColumn(
                      label: commonColText(
                          colorText: Colors.grey,
                          text: "Total (\$)".toUpperCase())),
                  DataColumn(
                      label: commonColText(
                          colorText: Colors.grey,
                          text: "Payment Type".toUpperCase())),
                  DataColumn(
                      label: commonColText(
                          colorText: Colors.grey,
                          text: "Payment Status".toUpperCase())),
                  DataColumn(
                      label: commonColText(
                          colorText: Colors.grey,
                          text: "Fulfillment Status".toUpperCase())),
                  DataColumn(
                      label: commonColText(
                          colorText: Colors.grey, text: "Items".toUpperCase())),
                  DataColumn(
                      label: commonColText(
                          colorText: Colors.grey,
                          text: "Shipping Method".toUpperCase())),
                ],
                source: RoleDataSourceEmpCustomer(provider.orderDraftList)),
          ],
        ),
      );
    }));
  }

  commonCardView({
    Widget? child,
  }) {
    return Container(
      // padding: const EdgeInsets.all(10),

      child: child ?? const SizedBox.shrink(),
    );
  }
}

class RoleDataSourceEmpCustomer extends DataTableSource {
  final List<Map<String, dynamic>> _roleList;

  RoleDataSourceEmpCustomer(this._roleList);

  @override
  DataRow getRow(int index) {
    final log = _roleList[index];
    return DataRow.byIndex(index: index, cells: [

      DataCell(
        commonText(text: log['store_name'], fontSize: 10),
      ),
      DataCell(commonText(text: log['store_type'], fontSize: 10)),
      DataCell(
        commonText(text: log['store_name'], fontSize: 10),
      ),
      DataCell(commonText(text: log['store_type'], fontSize: 10)),
      DataCell(
        commonText(text: log['store_name'], fontSize: 10),
      ),
      DataCell(commonText(text: log['store_type'], fontSize: 10)),
      DataCell(
        commonText(text: log['store_name'], fontSize: 10),
      ),
      DataCell(commonText(text: log['store_type'], fontSize: 10)),
      DataCell(
        commonText(text: log['store_name'], fontSize: 10),
      ),
      DataCell(commonText(text: log['store_type'], fontSize: 10)),
      DataCell(
        commonText(text: log['store_name'], fontSize: 10),
      ),


    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _roleList.length;

  @override
  int get selectedRowCount => 0;
}
