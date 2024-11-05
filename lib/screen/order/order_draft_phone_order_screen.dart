import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:parsonskellogg/core/color/color.dart';
import 'package:parsonskellogg/core/common/common_table_view.dart';
import 'package:parsonskellogg/core/common/common_text_field_widget.dart';
import 'package:parsonskellogg/core/common/common_text_widget.dart';
import 'package:parsonskellogg/core/component/component.dart';
import 'package:parsonskellogg/provider/order_provider.dart';
import 'package:provider/provider.dart';

class OrderDraftPhoneOrderScreen extends StatelessWidget {
  const OrderDraftPhoneOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return commonCardView(child:  Consumer<OrderProvider>(
        builder: (context, provider, child) {
          return SizedBox(

            child: CommonTableView(rowsPerPage: provider.orderDraftList.length, columns: [

              DataColumn(label: commonColText(
                  colorText: Colors.grey,

                  text: "Image".toUpperCase())),
              DataColumn(label: commonColText(
                  colorText: Colors.grey,
                  text: "Store Name".toUpperCase())),

              DataColumn(label: commonColText(
                  colorText: Colors.grey,
                  text: "Store Type".toUpperCase())),
              DataColumn(label: commonColText(
                  colorText: Colors.grey,
                  text: "Action".toUpperCase())),

            ],

                source: RoleDataSourceEmpCustomer(provider.orderDraftList)),
          );
        }));
  }

  commonCardView({
    Widget? child,
  }) {
    return Container(
      // padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2), // Shadow color
            offset: const Offset(0, 2), // Shadow position
            blurRadius: 4, // Shadow blur
            spreadRadius: 1, // Spread radius
          ),
        ],
      ),
      margin: const EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: CommonTextFieldWidget(
              hint: "Search",
              prefixIcon: Icon(Icons.search,size: 20,),
            ),
          ),
          const Divider(
            height: 5,
          ),
          child ?? const SizedBox.shrink()
        ],
      ),
    );
  }
}
class RoleDataSourceEmpCustomer  extends DataTableSource {
  final List<Map<String, dynamic>> _roleList;

  RoleDataSourceEmpCustomer(this._roleList);

  @override
  DataRow getRow(int index) {
    final log = _roleList[index];
    return DataRow.byIndex(index: index, cells: [
      DataCell(Container(

        width: 90,
        margin: EdgeInsets.all(4),
        height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(1),
          //  border: Border.all(color: Colors.grey,width: 1)
        ),
        child:  Center(
          child:  SvgPicture.network( log['image']),
        ),
      )),
      DataCell(
        commonText(

            text: log['store_name'], fontSize: 10),
      ),
      DataCell(commonText(

          text: log['store_type'], fontSize: 10)),


      DataCell(Container(
        margin: const EdgeInsets.all(10),
        decoration: commonBoxDecoration(
            border: Border.all(
                color:colorActiveBorder,width: 1
            ),
            borderRadius: BorderRadius.circular(5),
            color:colorActiveBg
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20,right: 20),
          child: Center(
            child: commonText(text: "Log In", fontSize: 8,colorText: colorActiveText,fontWeight: FontWeight.w800),
          ),
        ),
      )),



    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _roleList.length;

  @override
  int get selectedRowCount => 0;
}