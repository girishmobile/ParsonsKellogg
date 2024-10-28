import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:parsonskellogg/core/Indicator.dart';
import 'package:parsonskellogg/core/common/common_drop_down_view.dart';
import 'package:parsonskellogg/core/common/common_text_field_widget.dart';
import 'package:parsonskellogg/core/common/common_text_widget.dart';
import 'package:parsonskellogg/core/component/component.dart';
import 'package:parsonskellogg/core/constants/num_constants.dart';
import 'package:parsonskellogg/provider/dashboard_provider.dart';
import 'package:provider/provider.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);


    return SizedBox(
      width: size.width,
      height: size.height,
      child: Consumer<DashboardProvider>(builder: (context, provider, child) {
        return ListView(
          children: [

            Padding(
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
            ),
            commonCardView(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 6,
                    child: SizedBox(
                      child: commonGraph(provider: provider, context: context,item: provider.productStatusReportChartList),

                    ),
                  ),
                Expanded(
                    flex: 4,
                    child:   Container(
                      width: size.width,

                      padding: const EdgeInsets.all(10.0),
                      child: Wrap(
                          alignment: WrapAlignment.start,
                          direction: Axis.horizontal,

                          spacing: 10, // Space between items horizontally
                          runSpacing: 10, // Space between items vertically
                          children: provider.productStatusReportChartList.map((e) {
                            return Indicator(
                              color: e['color'],
                              text: e['category'],
                            );
                          }).toList()

                      ),
                    ))
                ],
              ),
            ),

            // SizedBox(height: 10,),
            commonCardView(
              title: "Product BC Sync Status Report",
              child: Row(
                children: [
                  Expanded(
                    flex: 6,
                    child: SizedBox(
                    child: commonGraph(
                        provider: provider, context: context, value: "38153",item: provider.productBCChartList),
                  ),),
                  Expanded(
                      flex: 4,
                      child:   Container(
                        width: size.width,

                        padding: const EdgeInsets.all(10.0),
                        child: Wrap(
                            alignment: WrapAlignment.start,
                            direction: Axis.horizontal,

                            spacing: 10, // Space between items horizontally
                            runSpacing: 10, // Space between items vertically
                            children: provider.productBCChartList.map((e) {
                              return Indicator(
                                color: e['color'],
                                text: e['category'],
                              );
                            }).toList()

                        ),
                      )),

                ],
              ),
            ),

            commonCardView(
              title: "Product BC Sync Status Report",
              child: SizedBox(
                height: 300,
                child: commonBarchart(barValues: provider.productReadyScoreValues,labels: provider.productReadyScoreLabels),
              ),
            ),
            commonCardView(
              title: "Order Report",
              child: Row(
                children: [
                  Expanded(
                    flex: 6,
                    child: SizedBox(
                      child: commonGraph(

                          provider: provider,
                          context: context,
                          text: "Total Order",
                          value: "4500", item: provider.customerOrderChartList),
                    ),
                  ),
                  Expanded(
                      flex: 4,
                      child:   Container(
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
                            }).toList()

                        ),
                      ))
                ],
              ),
            ),
            commonCardView(
              title: "Customer Order Report",
              child: Row(
                children: [
                  Expanded(
                    flex: 6,
                    child: SizedBox(
                      child: commonGraph(

                          provider: provider,
                          context: context,
                          text: "Total Order",
                          value: "4500", item: provider.customerOrderChartList),
                    ),
                  ),
                  Expanded(
                      flex: 5,
                      child:   Container(
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
                            }).toList()

                        ),
                      ))
                ],
              ),
            ),
            commonCardView(
              title: "Top 10 Brands",
              child: SizedBox(
                height: 300,
                child: commonBarchart(barValues: provider.topBrandsValue,labels: provider.topBrandsLabels),
              ),
            ),

            commonCardView(
              title: "Product",
              hideSubTitle: true,
              child: SizedBox(

                child: commonList(data: provider.productList),
              ),
            ),
            commonCardView(
              title: "Order",
              hideSubTitle: true,
              child: SizedBox(

                child: commonList(data: provider.orderReportsList),
              ),
            ),

            commonCardView(
              title: "Business Accounting Reports",
              hideSubTitle: true,
              child: SizedBox(

                child: commonList(data: provider.salesReportsList),
              ),
            ),
            commonCardView(
              title: "Custom",
              hideSubTitle: true,
              child: SizedBox(

                child: commonList(data: provider.mailReportsList),
              ),
            ),
          ],
        );
      }),
    );
  }

  commonGraph(
      {required DashboardProvider provider,
      String? value,
      String? text,
        required List<Map<String, dynamic>> item,
      required BuildContext context}) {
    List<PieChartSectionData> pieChartSections = item.map((e) {
      return  PieChartSectionData(
        color:  e['color'],
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

  commonCardView({
    Widget? child,
    String? title,
    bool? hideSubTitle=false
  }) {
    return Container(
      //  padding: const EdgeInsets.only(bottom: 5),
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
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CommonTextWidget(
              text: title ?? "Product Status Report",
              style: commonTextStyle(fontWeight: FontWeight.w700),
            ),
          ),
          hideSubTitle==true?SizedBox.shrink():Padding(
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
                      style: commonTextStyle(fontSize: 11, color: Colors.red),
                    ),
                  ],
                ),

              ],
            ),
          ),
          const Divider(
            height: 5,
          ),

          child ?? Container()
        ],
      ),
    );
  }
}

commonList({required List<String> data}){
  return ListView.builder(
      itemCount: data.length,
      shrinkWrap: true,

      primary: false
      ,
      padding: EdgeInsets.zero,
      itemBuilder: (context,index){

        return ListTile(
          visualDensity: VisualDensity(
            vertical: -3,
            horizontal: -4
          ),
        dense: true,
          title: CommonTextWidget(

            text: data[index],
            style: commonTextStyle(fontSize: 12,color: Colors.blueAccent),
          ),
        );

  });
}
commonBarchart({required List<double> barValues,required List<String> labels}){
  return Container(
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
                  style: commonTextStyle(
                      color: Colors.grey, fontSize: 10),
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
                    style: commonTextStyle(
                        color: Colors.grey, fontSize: 11),
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
                color: Colors.greenAccent,
              ),
            ],
          );
        }),
      ),
    ),
  );
}