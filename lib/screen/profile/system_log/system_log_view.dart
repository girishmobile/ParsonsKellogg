import 'package:flutter/material.dart';
import 'package:parsonskellogg/core/common/common_table_view.dart';
import 'package:parsonskellogg/core/common/common_text_widget.dart';
import 'package:parsonskellogg/core/component/component.dart';
import 'package:parsonskellogg/core/constants/num_constants.dart';
import 'package:parsonskellogg/core/string_utils/string_utils.dart';
import 'package:parsonskellogg/provider/profile_provider.dart';
import 'package:provider/provider.dart';

class SystemLogView extends StatelessWidget {
  const SystemLogView({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProfileProvider>(context);
    final totalRecords = provider.activityLogs.length;
    provider.setRowPerPageValue = totalRecords < provider.rowsPerPage
        ? totalRecords
        : provider.rowsPerPage;
    return ListView(
      children: [
        CommonTextWidget(
          text: accountActivity,
          left: twenty,
          top: twenty,
          style:
              commonTextStyle(fontSize: sixteen, fontWeight: FontWeight.w700),
        ),
        CommonTableView(
          rowsPerPage: provider.rowsPerPageValue,
          columns: [
            DataColumn(
                onSort: (columnIndex, ascending) {
                  provider.sort<String>((log) => log['user'], columnIndex,
                      ascending, provider, context);
                },
                label: commonColText(text: user)),
            DataColumn(
                onSort: (columnIndex, ascending) {
                  provider.sort<String>((log) => log['browser'], columnIndex,
                      ascending, provider, context);
                },
                label: commonColText(text: browser)),
            DataColumn(
                onSort: (columnIndex, ascending) {
                  provider.sort<String>((log) => log['date'], columnIndex,
                      ascending, provider, context);
                },
                label: commonColText(text: date)),
            DataColumn(
                onSort: (columnIndex, ascending) {
                  provider.sort<String>((log) => log['activity'], columnIndex,
                      ascending, provider, context);
                },
                label: commonColText(text: activity)),
            DataColumn(
                onSort: (columnIndex, ascending) {
                  provider.sort<String>((log) => log['ip'], columnIndex,
                      ascending, provider, context);
                },
                label: commonColText(text: ipAddress)),
            DataColumn(
                onSort: (columnIndex, ascending) {
                  provider.sort<String>((log) => log['location'], columnIndex,
                      ascending, provider, context);
                },
                label: commonColText(text: location)),
          ],
          source: _ActivityLogDataSource(provider.activityLogs),
          onRowsPerPageChange: totalRecords > provider.rowsPerPage
              ? (value) {
                  provider.setRowPerPageValue = value!;
                }
              : null,
          sortAscending: provider.isAscending,
          sortColumnIndex: provider.sortColumnIndex,
        ),
      ],
    );
  }
}

class _ActivityLogDataSource extends DataTableSource {
  final List<Map<String, dynamic>> _activityLogs;

  _ActivityLogDataSource(this._activityLogs);

  @override
  DataRow getRow(int index) {
    final log = _activityLogs[index];
    return DataRow.byIndex(index: index, cells: [
      DataCell(
        commonText(text: log['user'], fontSize: nine),
      ),
      DataCell(commonText(text: log['browser'], fontSize: nine)),
      DataCell(commonText(text: log['date'], fontSize: nine)),
      DataCell(commonText(text: log['activity'], fontSize: nine)),
      DataCell(commonText(text: log['ip'], fontSize: nine)),
      DataCell(commonText(text: log['location'], fontSize: nine)),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _activityLogs.length;

  @override
  int get selectedRowCount => 0;
}
