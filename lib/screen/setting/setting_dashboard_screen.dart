import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parsonskellogg/core/Indicator.dart';
import 'package:parsonskellogg/core/common/common_text_widget.dart';
import 'package:parsonskellogg/core/component/component.dart';
import 'package:parsonskellogg/core/constants/num_constants.dart';
import 'package:parsonskellogg/provider/dashboard_provider.dart';
import 'package:provider/provider.dart';

class SettingDashboardScreen extends StatelessWidget {
  const SettingDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

    return  Consumer<DashboardProvider>(
      builder: (context,provider,child) {
        return ListView(
          children: [
            commonCardView(
              child: commonList(data: provider.settingUserList)
            ),
            commonCardView(
              title: "Roles",
                child: commonList(data: provider.settingRoleList)
            ),
            commonCardView(
                title: "Modules Wise User",
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child:  Row(
                        children: [

                          Expanded(child: CommonTextWidget(text: "Module Name",style:commonTextStyle(color: Colors.grey,fontWeight: FontWeight.w700,fontSize: 12),)),
                          Expanded(child:  CommonTextWidget(text: "Users",textAlign: TextAlign.right,style:commonTextStyle(color: Colors.grey,fontWeight: FontWeight.w700,fontSize: 12)))
                        ],
                      ),
                    ),
                    Divider(height: 1,),
                    commonList(data: provider.settingModuleUserList)
                  ],
                )
            ),
            commonCardView(
              title: "Module Wise User Report",
              crossAxisAlignment: CrossAxisAlignment.start,
              child: Column(
                children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 6,
                        child: SizedBox(
                          child: commonGraph(provider: provider, context: context,item: provider.settingModuleUserGraphList),

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
                                children: provider.settingModuleUserGraphList.map((e) {
                                  return Indicator(
                                    color: e['color'],
                                    text: e['category'],
                                  );
                                }).toList()

                            ),
                          ))
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
      }
    );
  }

  commonCardView({
    Widget? child,
    CrossAxisAlignment? crossAxisAlignment,
    String? title,
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
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment:crossAxisAlignment?? CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: CommonTextWidget(
              text: title ?? "Users",
              style: commonTextStyle(fontWeight: FontWeight.w700),
            ),
          ),

          const Divider(
            height: 5,
          ),

          child??const SizedBox.shrink()
        ],
      ),
    );
  }

  commonList({required List<Map<String, dynamic>> data}){
    return ListView.separated(
        itemCount: data.length,
        shrinkWrap: true,

        primary: false
        ,
        padding: EdgeInsets.zero,
        itemBuilder: (context,index){

          return ListTile(
            visualDensity: const VisualDensity(
                vertical: -3,
                horizontal: -4
            ),
            dense: true,
            title: CommonTextWidget(

              text: data[index]['title'],
              style: commonTextStyle(fontSize: 12,color: Colors.black,fontWeight: FontWeight.w400),
            ),
            trailing: CommonTextWidget(

              text: data[index]['value'],
              style: commonTextStyle(fontSize: 12,color: Colors.black,fontWeight: FontWeight.w400),
            ),
          );

        }, separatorBuilder: (BuildContext context, int index) { return const Divider(thickness: 0.3,); },);
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
              centerSpaceRadius: 70,
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
                  commonText(text: text ?? "Total Modules"),
                  const SizedBox(
                    height: five,
                  ),
                  commonText(
                      text: value ?? "687",
                      fontWeight: FontWeight.w800,
                      fontSize: 16)
                ],
              ),
            ))
      ],
    );
  }
}
