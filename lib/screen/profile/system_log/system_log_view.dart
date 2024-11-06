import 'package:flutter/material.dart';
import 'package:parsonskellogg/core/common/common_drop_down_view.dart';
import 'package:parsonskellogg/core/common/common_table_view.dart';
import 'package:parsonskellogg/core/common/common_text_field_widget.dart';
import 'package:parsonskellogg/core/common/common_text_widget.dart';
import 'package:parsonskellogg/core/component/component.dart';
import 'package:parsonskellogg/core/constants/num_constants.dart';
import 'package:parsonskellogg/core/image_path/image_path.dart';
import 'package:parsonskellogg/core/string_utils/string_utils.dart';
import 'package:parsonskellogg/provider/profile_provider.dart';
import 'package:parsonskellogg/screen/profile/account_activity/dialog/edit_columns_dialog.dart';
import 'package:provider/provider.dart';

class SystemLogView extends StatelessWidget {
  const SystemLogView({super.key, this.title});

  final String? title;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProfileProvider>(context);
    final totalRecords = provider.activityLogs.length;
    provider.setRowPerPageValue = totalRecords < provider.rowsPerPage
        ? totalRecords
        : provider.rowsPerPage;
    return ListView(
      primary: false,
      shrinkWrap: true,
      children: [
        CommonTextWidget(
          text: title ?? accountActivity,
          left: twenty,
          top: twenty,
          style:
              commonTextStyle(fontSize: sixteen, fontWeight: FontWeight.w700),
        ),
        SizedBox(
          height: title != null ? 10 : 0,
        ),
        Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                title != null ?_topView(context: context, provider: provider):SizedBox.shrink(),
                CommonTableView(
                  rowsPerPage: provider.rowsPerPageValue,
                  columns: [
                    DataColumn(
                        onSort: (columnIndex, ascending) {
                          provider.sort<String>((log) => log['user'],
                              columnIndex, ascending, provider, context);
                        },
                        label: commonColText(text: user)),
                    DataColumn(
                        onSort: (columnIndex, ascending) {
                          provider.sort<String>((log) => log['browser'],
                              columnIndex, ascending, provider, context);
                        },
                        label: commonColText(text: browser)),
                    DataColumn(
                        onSort: (columnIndex, ascending) {
                          provider.sort<String>((log) => log['date'],
                              columnIndex, ascending, provider, context);
                        },
                        label: commonColText(text: date)),
                    DataColumn(
                        onSort: (columnIndex, ascending) {
                          provider.sort<String>((log) => log['activity'],
                              columnIndex, ascending, provider, context);
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
                          provider.sort<String>((log) => log['location'],
                              columnIndex, ascending, provider, context);
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
            ),
          ),
        ),
      ],
    );
  }

  _topView({required BuildContext context, required ProfileProvider provider}) {
    var size = MediaQuery.sizeOf(context);
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: CommonDropDownView(
                  height: 40,
                  selectedValue: provider.selectionValue,
                  onChanged: (value) {
                    provider.setSelectionData(value);
                  },
                  size: size,
                  items: ["My Log", "My Team"]),
            ),
            const SizedBox(
              width: 10,
            ),
            const Expanded(
                child: SizedBox(
              height: 40,
              child: CommonTextFieldWidget(
                borderRadius: 8,
                prefixIcon: Icon(
                  Icons.search,
                  size: 20,
                  color: Colors.grey,
                ),
                colorFill: Colors.white,
                hint: "Search",
              ),
            ))
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildIconContainer(
                onTap: () {
                  showAlertDialog(
                      dialogHeight: size.height * 0.7,
                      dialogWidth: size.width * 0.9,
                      context: context,
                      child: const EditColumnsDialog());
                },
                context: context,
                icon: icEditColum,
                label: editColumns),

            SizedBox(width: 5,),
            buildIconContainer(
               onTap: () {},
               context: context,
               icon: icDownload,
               label: download),
            SizedBox(width: 5,),
            Expanded(child:  buildIconContainer(
              onTap: () {},
              context: context,
              label: save,
              icon: icRefresh,
            ),),
            SizedBox(width: 5,),
           buildIconContainer(
             onTap: () {},
             context: context,
             icon: icRefresh,
           ),


          ],
        ),

        Row(
          children: [
            buildIconContainer(
              onTap: () {},
              context: context,
              label: moreFilter,
              icon: icFilter,
            ),
            SizedBox(
              width: 10,
            ),

          ],
        )
      ],
    );
  }

  Widget buildIconContainer(
      {required BuildContext context,
      String? icon,
      String? label,
      VoidCallback? onTap}) {
    return commonInkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(top: ten),
        padding: const EdgeInsets.all(ten),
        decoration: commonBoxDecoration(
            border:
                Border.all(color: Colors.grey.withOpacity(zero20), width: one),
            borderRadius: BorderRadius.circular(five)),
        child: Row(
          children: [
            loadAssetImage(
                path: icon ?? icEditColum,
                width: twentyFour,
                colorIcon: Colors.grey,

                height: twentyFour),
            CommonTextWidget(
              left: five,
              text: label,
              style: commonTextStyle(fontSize: 10, color: Colors.grey),
            )
          ],
        ),
      ),
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
