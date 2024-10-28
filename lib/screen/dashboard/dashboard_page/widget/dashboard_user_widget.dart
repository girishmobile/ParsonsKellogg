import 'package:flutter/material.dart';
import 'package:parsonskellogg/core/common/common_table_view.dart';
import 'package:parsonskellogg/core/component/component.dart';
import 'package:parsonskellogg/core/constants/num_constants.dart';
import 'package:parsonskellogg/core/string_utils/string_utils.dart';
import 'package:parsonskellogg/provider/dashboard_provider.dart';

class  DashboardUserWidget extends StatelessWidget {
  const  DashboardUserWidget({super.key,required this.provider});
 final DashboardProvider provider;

  @override
  Widget build(BuildContext context) {
    final totalRecords = provider.dashboardTopList.length;
    provider.setRowPerPageValue = totalRecords < provider.rowsPerPage
        ? totalRecords
        : provider.rowsPerPage;
    return  Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: ten, top: ten),
          child: commonText(
              fontSize: fourteen,
              fontWeight: FontWeight.w600,
              text: topTenCustomer),
        ),
        Padding(
          padding: const EdgeInsets.only(left: ten, top: five),
          child: RichText(
              text: TextSpan(
                  text: store,
                  style: commonTextStyle(
                      color: Colors.black, fontSize: ten),
                  children: [
                    TextSpan(
                      text: ' $allStore',
                      style:
                      commonTextStyle(color: Colors.red, fontSize: ten),
                    ),
                    TextSpan(
                      style:
                      commonTextStyle(color: Colors.blue, fontSize: ten),
                      text: ' $allDuration ',
                    ),
                  ])),
        ),
        const Divider(
          thickness: zero3,
        ),
        Expanded(
          child: CommonTableView(
              onRowsPerPageChange: totalRecords > provider.rowsPerPage
                  ? (value) {
                provider.setRowPerPageValue = value!;
              }
                  : null,
              sortAscending: provider.isAscending,
              sortColumnIndex: provider.sortColumnIndex,
              rowsPerPage: provider.rowsPerPageValue,
              columns: [
                DataColumn(
                    onSort: (columnIndex, ascending) {
                      provider.sort<String>((log) => log['user'],
                          columnIndex, ascending, provider, context);
                    },
                    label: Expanded(
                        child: commonColText(text: customerName))),
                DataColumn(
                    onSort: (columnIndex, ascending) {
                      provider.sort<String>((log) => log['item'],
                          columnIndex, ascending, provider, context);
                    },
                    label:
                    Expanded(child: commonColText(text: items))),
                DataColumn(
                    onSort: (columnIndex, ascending) {
                      provider.sort<String>(
                              (log) => log['last_order_revenue'],
                          columnIndex,
                          ascending,
                          provider,
                          context);
                    },
                    label: Expanded(
                        child:
                        commonColText(text: lastOrderRevenue))),
                DataColumn(
                    onSort: (columnIndex, ascending) {
                      provider.sort<String>(
                              (log) => log['last_order_date'],
                          columnIndex,
                          ascending,
                          provider,
                          context);
                    },
                    label: Expanded(
                        child: commonColText(text: lastOrderDate))),
                DataColumn(
                    onSort: (columnIndex, ascending) {
                      provider.sort<String>(
                              (log) => log['total_revenue'],
                          columnIndex,
                          ascending,
                          provider,
                          context);
                    },
                    label: Expanded(
                        child:
                        commonColText(text: totalRevenue))),
                DataColumn(
                    onSort: (columnIndex, ascending) {
                      provider.sort<String>((log) => log['store'],
                          columnIndex, ascending, provider, context);
                    },
                    label:
                    Expanded(child: commonColText(text: store))),
              ],
              source: DashboardDataSource(provider.dashboardTopList)),
        ),
      ],
    );
  }
}

class DashboardDataSource extends DataTableSource {
  final List<Map<String, dynamic>> _dashboardList;

  DashboardDataSource(this._dashboardList);

  @override
  DataRow getRow(int index) {
    final log = _dashboardList[index];
    return DataRow.byIndex(index: index, cells: [
      DataCell(
        commonText(text: log['user'], fontSize: ten),
      ),
      DataCell(commonText(text: log['item'], fontSize: ten)),
      DataCell(commonText(text: log['last_order_revenue'], fontSize: ten)),
      DataCell(commonText(text: log['last_order_date'], fontSize: ten)),
      DataCell(commonText(text: log['total_revenue'], fontSize: ten)),
      DataCell(commonText(text: log['store'], fontSize: ten)),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _dashboardList.length;

  @override
  int get selectedRowCount => 0;
}
