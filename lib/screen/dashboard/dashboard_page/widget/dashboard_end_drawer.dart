import 'package:flutter/material.dart';
import 'package:parsonskellogg/core/color/color.dart';
import 'package:parsonskellogg/core/component/component.dart';
import 'package:parsonskellogg/core/constants/num_constants.dart';
import 'package:parsonskellogg/core/string_utils/string_utils.dart';
import 'package:parsonskellogg/provider/dashboard_provider.dart';
class DashboardEndDrawer extends StatelessWidget {
  const DashboardEndDrawer({super.key,required this.provider});
 final DashboardProvider provider;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: colorBg,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: provider.dashboardWidgetItem.length + 1,
        // +1 for the DrawerHeader
        //on Click
        //  print('Tapped on ${drawerItems[index - 1]}');
        itemBuilder: (context, index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.only(left: fifteen),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  commonText(text: dashboardWidget,fontWeight: FontWeight.w700,fontSize: fourteen),
                  IconButton(onPressed: (){
                    Navigator.of(context).pop();
                  }, icon: const Icon(Icons.close))
                ],
              ),
            );
          }
          return Container(
        padding: EdgeInsets.all(10),
            margin: const EdgeInsets.only(left: fifteen,right: fifteen,top: five,bottom: five),
            decoration: commonBoxDecoration(color: Colors.white),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.drag_indicator),
                    const SizedBox(
                      width: twenty,
                    ),
                    Image.network(
                      fit: BoxFit.cover,
                      provider.dashboardWidgetItem[index - 1].imageUrl
                          .toString(),
                      width: oneHundredTwenty,
                      height: oneHundredTwenty,
                    ),
                    const SizedBox(
                      width: twenty,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(eight),
                  child: commonText(
                    fontSize: ten,
                    fontWeight: FontWeight.w700,
                    text: provider.dashboardWidgetItem[index - 1].title,
                  ),
                )
              ],
            ),
          );

        },
      ),
    );
  }
}
