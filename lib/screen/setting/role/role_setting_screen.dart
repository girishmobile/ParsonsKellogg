import 'package:flutter/material.dart';
import 'package:parsonskellogg/core/common/common_text_field_widget.dart';
import 'package:parsonskellogg/core/component/component.dart';

import 'package:parsonskellogg/provider/profile_provider.dart';
import 'package:provider/provider.dart';

import '../../../core/common/common_table_view.dart';


class RoleSettingScreen extends StatelessWidget {
  const RoleSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProfileProvider>(context);
    final totalRecords = provider.roleList.length;
    FocusNode focusNode = FocusNode();
    final searchController = TextEditingController();
    provider.setRowPerPageValue = totalRecords < provider.rowsPerPage
        ? totalRecords
        : provider.rowsPerPage;
    return ListView(
      children: [

        Container(

        decoration: commonBoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5)
        ),
          margin: const EdgeInsets.only(left: 10,right: 10,top: 20),
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 40,

                child:  CommonTextFieldWidget(

                  onChanged: (value) {
                  provider.filterRole(value);
                  },
                  prefixIcon: const Icon(Icons.search),
                  colorFill: Colors.white,
                  controller: searchController,
                  hint: "Search",

                ),
              ),

              CommonTableView(
                rowsPerPage: provider.rowsPerPageValue,
                columns: [
                  DataColumn(
                      onSort: (columnIndex, ascending) {
                        provider.sort<String>((log) => log['user'], columnIndex,
                            ascending, provider, context);
                      },
                      label: commonColText(text: "ROLE NAME")),

                  DataColumn(
                      onSort: (columnIndex, ascending) {
                        provider.sort<String>((log) => log['date'], columnIndex,
                            ascending, provider, context);
                      },
                      label: commonColText(text: "Created date".toUpperCase())),
                  DataColumn(
                      onSort: (columnIndex, ascending) {
                        provider.sort<String>((log) => log['created_by'], columnIndex,
                            ascending, provider, context);
                      },
                      label: commonColText(text: "Created By".toUpperCase())),
                  DataColumn(
                      onSort: (columnIndex, ascending) {
                        provider.sort<String>((log) => log['updated_by'], columnIndex,
                            ascending, provider, context);
                      },
                      label: commonColText(text: "Updated By")),
                  DataColumn(
                      onSort: (columnIndex, ascending) {
                        provider.sort<String>((log) => log['update_status'], columnIndex,
                            ascending, provider, context);
                      },
                      label: commonColText(text: "Updated Date".toUpperCase())),
                  DataColumn(
                      onSort: (columnIndex, ascending) {
                        provider.sort<String>((log) => log['status'], columnIndex,
                            ascending, provider, context);
                      },
                      label: commonColText(text: "status".toUpperCase())),
                  DataColumn(
                      onSort: (columnIndex, ascending) {
                        provider.sort<String>((log) => log['status'], columnIndex,
                            ascending, provider, context);
                      },
                      label: commonColText(text: '')),
                ],
                source: RoleDataSource(provider.roleList),
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
        )

      ],
    );
  }
}
class RoleDataSource extends DataTableSource {
  final List<Map<String, dynamic>> _roleList;

  RoleDataSource(this._roleList);

  @override
  DataRow getRow(int index) {
    final log = _roleList[index];
    return DataRow.byIndex(index: index, cells: [
      DataCell(
        commonText(text: log['user'], fontSize: 10),
      ),
      DataCell(commonText(text: log['date'], fontSize: 10)),
      DataCell(commonText(text: log['created_by'], fontSize: 10)),
      DataCell(commonText(text: log['updated_by'], fontSize: 10)),
      DataCell(commonText(text: log['update_status'], fontSize: 10)),
      DataCell(Container(
        margin: const EdgeInsets.all(10),
       decoration: commonBoxDecoration(
         borderRadius: BorderRadius.circular(5),
         color: const Color.fromRGBO(220,252,231,1)
       ),
        child: Center(
          child: commonText(text: log['status'].toString().toUpperCase(), fontSize: 8,colorText: Colors.green,fontWeight: FontWeight.w800),
        ),
      )),
      DataCell(buildPopupMenu())


    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _roleList.length;

  @override
  int get selectedRowCount => 0;
}

Widget buildPopupMenu() {
  return PopupMenuButton<String>(
    color: Colors.white,
    onSelected: (String value) {
      // Handle the selected option
      if (value == 'edit') {
        // Handle Active logic
      } else if (value == 'delete') {
        print('======onClickDelete');
        //provider.deleteProcedureCharges(context: context, ID: id.toString());
      }
    },
    itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
      const PopupMenuItem<String>(
        value: 'edit',
        child: Text('Edit'),
      ),
      const PopupMenuItem<String>(
        value: 'delete',
        child: Text('Delete'),
      ),
      const PopupMenuItem<String>(
        value: 'delete',
        child: Text('Clone'),
      ),
      const PopupMenuItem<String>(
        value: 'delete',
        child: Text('InActive'),
      ),
    ],
    child: const Icon(
      Icons.more_vert,
      color: Colors.grey,
    ), // Icon to trigger the pop-up menu
  );
}
