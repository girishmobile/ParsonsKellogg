import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:parsonskellogg/core/Indicator.dart';
import 'package:parsonskellogg/core/color/color.dart';
import 'package:parsonskellogg/core/common/common_table_view.dart';
import 'package:parsonskellogg/core/common/common_text_widget.dart';
import 'package:parsonskellogg/core/component/component.dart';
import 'package:parsonskellogg/provider/dashboard_provider.dart';
import 'package:parsonskellogg/provider/order_provider.dart';
import 'package:parsonskellogg/screen/dashboard/dashboard_page/widget/dashboard_map_widget.dart';
import 'package:provider/provider.dart';

import '../../core/constants/num_constants.dart';

class OrderDashboard extends StatelessWidget {
  const OrderDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    final List<double> productReadyScoreValues = [
      80,
    ];
    final List<String> productReadyScoreLabels = [
      'eCommerce Store',
    ];
    return SizedBox(
      width: size.width,
      height: size.height,
      child: Consumer<OrderProvider>(builder: (context, provider, child) {
        return ListView(
          shrinkWrap: true,
          primary: false,
          children: [
            /*     Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Expanded(
                      flex: 5,
                      child: CommonTextWidget(text: "Reports",style: commonTextStyle(fontSize: 16,fontWeight: FontWeight.w700),)),
                  Expanded(
                      flex: 5,
                      child:  CommonDropDownView(
                          height: 40,
                          onChanged: (value){
                            provider.selectedValue==value;
                          },
                          selectedValue: provider.selectedValue,

                          size: size, items: ["All State","24 on tour"]))
                ],
              ),
            ),*/
            commonCardView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  commonRow(),
                  commonDivider(),
                  commonRow(text: "Synced Order", value: "0"),
                  commonDivider(),
                  commonRow(text: "Not Synced Order", value: "1"),
                ],
              ),
            ),

            // SizedBox(height: 10,),
            commonCardView(
              title: "Order Detail",
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  commonRow(text: "New Orders", value: "1"),
                  commonDivider(),
                  commonRow(text: "Pending Orders", value: "0"),
                  commonDivider(),
                  commonRow(text: "All Orders", value: "1"),
                ],
              ),
            ),
            commonCardView(
              title: "Monthly Sales Details",
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  commonRow(text: "Total Orders", value: "66"),
                  commonDivider(),
                  commonRow(text: "Order Amount", value: "\$104190.56"),
                  commonDivider(),
                  commonRow(
                      text: "Total Revenue (Captured)", value: "\$55149.84"),
                ],
              ),
            ),
            commonCardView(
              title: "Product Detail",
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  commonRow(text: "Total Products", value: "38744"),
                  commonDivider(),
                  commonRow(text: "Active Products", value: "34892"),
                  commonDivider(),
                  commonRow(text: "InActive Products", value: "985"),
                ],
              ),
            ),

            SizedBox(
              height: 180,
              width: size.width,
              child:
                  Consumer<OrderProvider>(builder: (context, provider, child) {
                return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: provider.orderList.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      var data = provider.orderList[index];
                      return Container(
                        width: size.width * 0.8,
                        height: 200,
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              // Shadow color
                              offset: const Offset(0, 2),
                              // Shadow position
                              blurRadius: 4,
                              // Shadow blur
                              spreadRadius: 1, // Spread radius
                            ),
                          ],
                        ),
                        child: commonCardView(
                            isList: true,
                            title: data.title,
                            child: Expanded(
                              child: Center(
                                child: CommonTextWidget(
                                  text: '\$${data.price}',
                                  style: commonTextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 17,
                                      color: const Color.fromRGBO(
                                          53, 165, 146, 1)),
                                ),
                              ),
                            )),
                      );
                    });
              }),
            ),
            SizedBox(
              height: 180,
              width: size.width,
              child:
                  Consumer<OrderProvider>(builder: (context, provider, child) {
                return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: provider.orderList1.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      var data = provider.orderList1[index];
                      return Container(
                        width: size.width * 0.8,
                        height: 200,
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              // Shadow color
                              offset: const Offset(0, 2),
                              // Shadow position
                              blurRadius: 4,
                              // Shadow blur
                              spreadRadius: 1, // Spread radius
                            ),
                          ],
                        ),
                        child: commonCardView(
                            isList: true,
                            title: data.title,
                            child: Expanded(
                              child: Center(
                                child: CommonTextWidget(
                                  text: "No data found as of now",
                                  style: commonTextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      color: Colors.black),
                                ),
                              ),
                            )),
                      );
                    });
              }),
            ),
            SizedBox(
              height: 350,
              child: Container(
                  margin: const EdgeInsets.all(10),
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
                  child: Consumer<DashboardProvider>(
                      builder: (context, provider, child) {
                    return SizedBox(
                        height: 200,
                        child: DashboardMapWidget(provider: provider));
                  })),
            ),
            SizedBox(
              height: 350,
              child: SizedBox(
                height: 350,
                child: Container(
                  margin: const EdgeInsets.all(10),
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
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        CommonTextWidget(
                          text: "Total Sales By Revenue",
                          style: commonTextStyle(fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        CommonTextWidget(
                          text: "( Last 24 Hours )",
                          style: commonTextStyle(
                              fontSize: 12,
                              color: const Color.fromRGBO(8, 145, 178, 1)),
                        ),
                        Expanded(
                            child: commonBarchart(
                                barValues: productReadyScoreValues,
                                labels: productReadyScoreLabels))
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 400,
              // width: size.width,
              child: commonCardView(
                title: "Top 5 Store Order By MarketPlace",
                child: Consumer<OrderProvider>(
                    builder: (context, provider, child) {
                  return DataTable(
                    dataRowMaxHeight: 56,
                    columns: [
                      DataColumn(
                        label: CommonTextWidget(
                          text: '#',
                          style: commonTextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.grey,
                              fontSize: 12),
                        ),
                      ),
                      DataColumn(
                        label: CommonTextWidget(
                            text: '# MarketPlace',
                            style: commonTextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.grey,
                                fontSize: 12)),
                      ),
                      DataColumn(
                        label: CommonTextWidget(
                            text: '#Orders',
                            style: commonTextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.grey,
                                fontSize: 12)),
                      ),
                    ],
                    rows: context
                        .read<OrderProvider>()
                        .orderListTable
                        .map((item) => DataRow(cells: [
                              DataCell(CommonTextWidget(
                                text: '1.',
                                style: commonTextStyle(fontSize: 12),
                              )),
                              DataCell(Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: colorActiveText,
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: Colors.white, width: 1)),
                                    width: 35,
                                    height: 35,
                                    child: Center(
                                      child: CommonTextWidget(
                                        text: item.title?[0],
                                        style: commonTextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 11,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  CommonTextWidget(
                                      left: 10,
                                      text: item.title,
                                      style: commonTextStyle(fontSize: 10))
                                ],
                              )),
                              DataCell(Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CommonTextWidget(
                                      text: '1',
                                      style: commonTextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400)),
                                  CommonTextWidget(
                                      text: '\$${item.price}',
                                      style: commonTextStyle(
                                          fontSize: 12,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w400)),
                                ],
                              )),
                            ]))
                        .toList(),
                  );
                }),
              ),
            ),

            ListView(
              shrinkWrap: true,
              children: [
                SizedBox(
                  width: size.width,
                  child: commonCardView(
                    title: "Customer Orders By Last 15 Days",
                    child: Consumer<OrderProvider>(
                        builder: (context, provider, child) {
                      return SizedBox(
                        height: 400,
                        child: CommonTableView(
                            rowsPerPage: provider.customerOrderList.length,
                            columns: [
                              DataColumn(
                                  label: commonColText(
                                      colorText: Colors.grey,
                                      text: "Customer Name".toUpperCase())),
                              DataColumn(
                                  label: commonColText(
                                      colorText: Colors.grey,
                                      text: "Order Number".toUpperCase())),
                              DataColumn(
                                  label: commonColText(
                                      colorText: Colors.grey,
                                      text: "Order Note".toUpperCase())),
                              DataColumn(
                                  label: commonColText(
                                      colorText: Colors.grey,
                                      text: "Order Is Cancel".toUpperCase())),
                              DataColumn(
                                  label: commonColText(
                                      colorText: Colors.grey,
                                      text: "Total Items".toUpperCase())),
                              DataColumn(
                                  label: commonColText(
                                      colorText: Colors.grey,
                                      text: "Sub Total (\$)".toUpperCase())),
                              DataColumn(
                                  label: commonColText(
                                      colorText: Colors.grey,
                                      text: "Total (\$)".toUpperCase())),
                              DataColumn(
                                  label: commonColText(
                                      colorText: Colors.grey,
                                      text: "Order Date".toUpperCase())),
                            ],
                            source: RoleDataSource(provider.customerOrderList)),
                      );
                    }),
                  ),
                ),
              ],
            ),
            commonCardView(
              title: "Order Details",
              child: Row(
                children: [
                  Expanded(
                    flex: 6,
                    child: SizedBox(
                      child: commonGraph(
                          provider: provider,
                          context: context,
                          text: "Total Order",
                          value: "3",
                          item: provider.customerOrderChartList),
                    ),
                  ),
                  Expanded(
                      flex: 4,
                      child: Container(
                        width: size.width,
                        padding: const EdgeInsets.all(10.0),
                        child: Wrap(
                            alignment: WrapAlignment.start,
                            direction: Axis.horizontal,
                            spacing: 10, // Space between items horizontally
                            runSpacing: 10, // Space between items vertically
                            children: provider.customerOrderChartList.map((e) {
                              return Indicator(
                                color: e['color'],
                                text: e['category'],
                              );
                            }).toList()),
                      ))
                ],
              ),
            ),
            commonCardView(
              title: "Order Synced Details",
              child: Row(
                children: [
                  Expanded(
                    flex: 6,
                    child: SizedBox(
                      child: commonGraph(
                          provider: provider,
                          context: context,
                          text: "",
                          value: "",
                          item: provider.orderSaleChart),
                    ),
                  ),
                  Expanded(
                      flex: 4,
                      child: Container(
                        width: size.width,
                        padding: const EdgeInsets.all(10.0),
                        child: Wrap(
                            alignment: WrapAlignment.start,
                            direction: Axis.horizontal,
                            spacing: 10, // Space between items horizontally
                            runSpacing: 10, // Space between items vertically
                            children: provider.orderSaleChart.map((e) {
                              return Indicator(
                                color: e['color'],
                                text: e['category'],
                              );
                            }).toList()),
                      ))
                ],
              ),
            ),
            commonCardView(
              title: "Store Type Total Order",
              child: Row(
                children: [
                  Expanded(
                    flex: 6,
                    child: SizedBox(
                      child: commonGraph(
                          provider: provider,
                          context: context,
                          text: "Total Order",
                          value: "3",
                          item: provider.orderStoreChart),
                    ),
                  ),
                  Expanded(
                      flex: 4,
                      child: Container(
                        width: size.width,
                        padding: const EdgeInsets.all(10.0),
                        child: Wrap(
                            alignment: WrapAlignment.start,
                            direction: Axis.horizontal,
                            spacing: 10, // Space between items horizontally
                            runSpacing: 10, // Space between items vertically
                            children: provider.orderStoreChart.map((e) {
                              return Indicator(
                                color: e['color'],
                                text: e['category'],
                              );
                            }).toList()),
                      ))
                ],
              ),
            ),
            commonCardView(
              title: "Top 5 Ordered Products",
              child: Row(
                children: [
                  Expanded(
                    flex: 6,
                    child: SizedBox(
                      child: commonGraph(
                          provider: provider,
                          context: context,
                          text: "",
                          value: "",
                          item: provider.orderTopFiveChart),
                    ),
                  ),
                  Expanded(
                      flex: 4,
                      child: Container(
                        width: size.width,
                        padding: const EdgeInsets.all(10.0),
                        child: Wrap(
                            alignment: WrapAlignment.start,
                            direction: Axis.horizontal,
                            spacing: 10, // Space between items horizontally
                            runSpacing: 10, // Space between items vertically
                            children: provider.orderTopFiveChart.map((e) {
                              return Indicator(
                                color: e['color'],
                                text: e['category'],
                              );
                            }).toList()),
                      ))
                ],
              ),
            ),
            ListView(
              shrinkWrap: true,
              children: [
                SizedBox(
                  width: size.width,
                  child: commonCardView(
                    title: "Uncaptured Orders",
                    child: Consumer<OrderProvider>(
                        builder: (context, provider, child) {
                      return SizedBox(
                        height: 400,
                        child: CommonTableView(
                            rowsPerPage: provider.customerUncapturedList.length,
                            columns: [
                              DataColumn(
                                  label: commonColText(
                                      colorText: Colors.grey,
                                      text: "StoreName".toUpperCase())),
                              DataColumn(
                                  label: commonColText(
                                      colorText: Colors.grey,
                                      text: "Order".toUpperCase())),
                              DataColumn(
                                  label: commonColText(
                                      colorText: Colors.grey,
                                      text: "Order Date".toUpperCase())),
                              DataColumn(
                                  label: commonColText(
                                      colorText: Colors.grey,
                                      text: "Customer Name".toUpperCase())),
                              DataColumn(
                                  label: commonColText(
                                      colorText: Colors.grey,
                                      text: "Email".toUpperCase())),
                              DataColumn(
                                  label: commonColText(
                                      colorText: Colors.grey,
                                      text: "Order Total (\$)".toUpperCase())),
                              DataColumn(
                                  label: commonColText(
                                      colorText: Colors.grey,
                                      text: "Status".toUpperCase())),
                            ],
                            source: RoleDataSourceUncaptured(
                                provider.customerUncapturedList)),
                      );
                    }),
                  ),
                ),
              ],
            ),

            ListView(
              shrinkWrap: true,
              primary: false,
              children: [
                SizedBox(
                  width: size.width,
                  child: commonCardView(
                    title: "Order By Customer and Employee",
                    child: Consumer<OrderProvider>(
                        builder: (context, provider, child) {
                      return SizedBox(
                        height: 400,
                        child: CommonTableView(
                            rowsPerPage:
                                provider.customerListCustomerAndEMp.length,
                            columns: [
                              DataColumn(
                                  label: commonColText(
                                      colorText: Colors.grey,
                                      text: "Store Logo".toUpperCase())),
                              DataColumn(
                                  label: commonColText(
                                      colorText: Colors.grey,
                                      text: "Store Name".toUpperCase())),
                              DataColumn(
                                  label: commonColText(
                                      colorText: Colors.grey,
                                      text: "Customer Name".toUpperCase())),
                              DataColumn(
                                  label: commonColText(
                                      colorText: Colors.grey,
                                      text: "Customer Email".toUpperCase())),
                              DataColumn(
                                  label: commonColText(
                                      colorText: Colors.grey,
                                      text: "Total Orders ".toUpperCase())),
                              DataColumn(
                                  label: commonColText(
                                      colorText: Colors.grey,
                                      text: "Order Total (\$)".toUpperCase())),
                            ],
                            source: RoleDataSourceEmpCustomer(
                                provider.customerListCustomerAndEMp)),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ],
        );
      }),
    );
  }

  commonGraph(
      {required OrderProvider provider,
      String? value,
      String? text,
      required List<Map<String, dynamic>> item,
      required BuildContext context}) {
    List<PieChartSectionData> pieChartSections = item.map((e) {
      return PieChartSectionData(
        color: e['color'],
        value: e['value']?.toDouble() ?? 0,
        title: '',
        titleStyle: commonTextStyle(color: Colors.white),
        radius: twenty,
      );
    }).toList();

    return Stack(
      children: [
        SizedBox(
          height: 200,
          child: PieChart(
            PieChartData(
              sections: pieChartSections,
              centerSpaceRadius: 60,
              sectionsSpace: 2,
            ),
          ),
        ),
        Positioned(
            top: zero,
            bottom: zero,
            left: zero,
            right: zero,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // Centers the content vertically
                children: [
                  commonText(text: text ?? "Total Product"),
                  const SizedBox(
                    height: five,
                  ),
                  commonText(
                      text: value ?? "47586",
                      fontWeight: FontWeight.w800,
                      fontSize: 16)
                ],
              ),
            ))
      ],
    );
  }

  commonRow({
    String? value,
    String? text,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CommonTextWidget(
            text: text ?? "Total Order",
            style: commonTextStyle(fontSize: 12, fontWeight: FontWeight.w400),
          ),
          CommonTextWidget(
            text: value ?? "1",
            style: commonTextStyle(fontSize: 12, fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }

  commonCardView(
      {Widget? child,
      String? title,
      bool? hideSubTitle = false,
      bool? isList = false}) {
    return Container(
      // padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(isList == true ? 0 : 4),
        boxShadow: [
          isList == true
              ? const BoxShadow(color: Colors.white)
              : BoxShadow(
                  color: Colors.black.withOpacity(0.2), // Shadow color
                  offset: const Offset(0, 2), // Shadow position
                  blurRadius: 4, // Shadow blur
                  spreadRadius: 1, // Spread radius
                ),
        ],
      ),
      margin: EdgeInsets.all(isList == true ? 0 : 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CommonTextWidget(
              text: title ?? "Orders Sync Details",
              style: commonTextStyle(fontWeight: FontWeight.w700),
            ),
          ),
          hideSubTitle == true
              ? const SizedBox.shrink()
              : Padding(
                  padding: const EdgeInsets.only(left: 8, bottom: 8),
                  child: Row(
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CommonTextWidget(
                            text: "Store : ",
                            style: commonTextStyle(fontSize: 11),
                          ),
                          CommonTextWidget(
                            text: "All Stores",
                            style: commonTextStyle(
                                fontSize: 11, color: Colors.red),
                          ),
                          CommonTextWidget(
                            text: " ( Last 24 Hours )",
                            style: commonTextStyle(
                                fontSize: 11,
                                color: const Color.fromRGBO(8, 145, 178, 1)),
                          ),
                        ],
                      ),
                    ],
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

commonDivider() {
  return const Divider(
    thickness: 0.4,
  );
}

commonBarchart(
    {required List<double> barValues, required List<String> labels}) {
  return Container(
    height: 100,
    margin: const EdgeInsets.all(20),
    child: BarChart(
      BarChartData(
        borderData: FlBorderData(
          border: Border.all(color: Colors.grey),
        ),
        backgroundColor: Colors.white,
        alignment: BarChartAlignment.spaceAround,
        maxY: 100,
        // Adjust to cover all values
        barTouchData: BarTouchData(enabled: false),
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 40,
              getTitlesWidget: (value, meta) {
                return CommonTextWidget(
                  text: '${value.toInt()}',
                  style: commonTextStyle(color: Colors.grey, fontSize: 10),
                );
              },
            ),
          ),
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                if (value.toInt() < labels.length) {
                  return CommonTextWidget(
                    text: labels[value.toInt()],
                    style: commonTextStyle(color: Colors.grey, fontSize: 11),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ),
        gridData: const FlGridData(show: true),
        barGroups: List.generate(barValues.length, (index) {
          return BarChartGroupData(
            x: index,
            barRods: [
              BarChartRodData(
                width: 40,
                borderRadius: BorderRadius.zero,
                toY: barValues[index],
                color: Color.fromRGBO(134, 239, 172, 1),
              ),
            ],
          );
        }),
      ),
    ),
  );
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
      DataCell(commonText(
          colorText: Colors.blue, text: log['order_no'], fontSize: 10)),
      DataCell(commonText(text: log['order_note'], fontSize: 10)),
      DataCell(commonText(text: log['order_cancel'], fontSize: 10)),
      DataCell(commonText(text: log['total_team'], fontSize: 10)),
      DataCell(commonText(text: log['sub_total'], fontSize: 10)),
      DataCell(commonText(text: log['total'], fontSize: 10)),
      DataCell(Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          commonText(text: log['order_date'], fontSize: 10),
          commonText(text: log['order_tiem'], fontSize: 8)
        ],
      )),
      //  DataCell(commonText(text: log['order_tiem'], fontSize: 10)),

      //DataCell()
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _roleList.length;

  @override
  int get selectedRowCount => 0;
}

class RoleDataSourceUncaptured extends DataTableSource {
  final List<Map<String, dynamic>> _roleList;

  RoleDataSourceUncaptured(this._roleList);

  @override
  DataRow getRow(int index) {
    final log = _roleList[index];
    return DataRow.byIndex(index: index, cells: [
      DataCell(
        commonText(text: log['store_name'], fontSize: 10),
      ),
      DataCell(commonText(
          colorText: Colors.blue, text: log['order_no'], fontSize: 10)),
      DataCell(Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          commonText(text: log['order_date'], fontSize: 10),
          commonText(text: log['order_tiem'], fontSize: 8)
        ],
      )),
      DataCell(commonText(text: log['customer_name'], fontSize: 10)),
      DataCell(commonText(text: log['email'], fontSize: 10)),
      DataCell(commonText(text: log['order_total'], fontSize: 10)),
      DataCell(Container(
        margin: const EdgeInsets.all(10),
        decoration: commonBoxDecoration(
            border: Border.all(
                color: log['status'] == "pending"
                    ? colorPendingBorder
                    : colorActiveBorder,
                width: 1),
            borderRadius: BorderRadius.circular(5),
            color: log['status'] == "pending" ? colorPendingBG : colorActiveBg),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Center(
            child: commonText(
                text: log['status'].toString().toUpperCase(),
                fontSize: 8,
                colorText: log['status'] == "pending"
                    ? colorPendingText
                    : colorActiveText,
                fontWeight: FontWeight.w800),
          ),
        ),
      )),
      //  DataCell(commonText(text: log['total'], fontSize: 10)),

      //  DataCell(commonText(text: log['order_tiem'], fontSize: 10)),

      //DataCell()
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _roleList.length;

  @override
  int get selectedRowCount => 0;
}

class RoleDataSourceEmpCustomer extends DataTableSource {
  final List<Map<String, dynamic>> _roleList;

  RoleDataSourceEmpCustomer(this._roleList);

  @override
  DataRow getRow(int index) {
    final log = _roleList[index];
    return DataRow.byIndex(index: index, cells: [
      DataCell(Container(
        width: 60,
        margin: EdgeInsets.all(4),
        height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(1),
            border: Border.all(color: Colors.grey, width: 1)),
        child: Center(
          child: CommonTextWidget(
            text: "Logo",
          ),
        ),
      )),
      DataCell(
        commonText(text: log['store_name'], fontSize: 10),
      ),
      DataCell(commonText(
          colorText: Colors.blue, text: log['customer_name'], fontSize: 10)),
      DataCell(commonText(text: log['email'], fontSize: 10)),
      DataCell(commonText(text: log['total_orders'], fontSize: 10)),
      DataCell(commonText(text: log['order_total'], fontSize: 10)),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _roleList.length;

  @override
  int get selectedRowCount => 0;
}
