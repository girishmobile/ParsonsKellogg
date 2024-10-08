import 'package:flutter/material.dart';
import 'package:parsonskellogg/core/common/common_button_widget.dart';
import 'package:parsonskellogg/core/component/component.dart';
import 'package:parsonskellogg/core/constants/num_constants.dart';
import 'package:parsonskellogg/core/string_utils/string_utils.dart';
import 'package:parsonskellogg/provider/dashboard_provider.dart';
import 'package:parsonskellogg/screen/dashboard/dashboard_page/widget/dashboard_end_drawer.dart';
import 'package:parsonskellogg/screen/dashboard/dashboard_page/widget/dashboard_graph_widget.dart';
import 'package:parsonskellogg/screen/dashboard/dashboard_page/widget/dashboard_map_widget.dart';
import 'package:parsonskellogg/screen/dashboard/dashboard_page/widget/dashboard_top_widget.dart';
import 'package:parsonskellogg/screen/dashboard/dashboard_page/widget/dashboard_user_widget.dart';
import 'package:provider/provider.dart';

import '../../../core/common/common_drop_down_view.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

    return Consumer<DashboardProvider>(builder: (context, provider, child) {
      final totalRecords = provider.dashboardTopList.length;
      provider.setRowPerPageValue = totalRecords < provider.rowsPerPage
          ? totalRecords
          : provider.rowsPerPage;
      return Scaffold(
        endDrawer: DashboardEndDrawer(
          provider: provider,
        ),
        // /   appBar: AppBar(),
        body: Consumer<DashboardProvider>(builder: (context, provider, child) {
          return Scaffold(
            body: ListView(
              primary: false,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.all(ten),
                        child: CommonDropDownView(
                          height: forty,
                          size: size,
                          horizontal: ten,
                          items: provider.itemsAllDuration,
                          onChanged: (String? value) {
                            provider.selectionValueDuration = value ?? '';
                          },
                          selectedValue: provider.selectedValueDuration,
                          hint: "All Duration",
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.all(ten),
                        child: CommonDropDownView(
                          size: size,
                          height: forty,
                          horizontal: ten,
                          items: provider.itemsAllStore,
                          onChanged: (String? value) {
                            provider.selectionValueAllStore = value ?? '';
                          },
                          selectedValue: provider.selectedValueAllStore,
                          hint: allStore,
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(left: thirty, right: thirty),
                  child: CommonButtonWidget(
                    top: zero,
                    style: commonTextStyle(fontSize: twelve, color: Colors.white),
                    text: addDashboardWidget,
                    onTap: () {
                      Scaffold.of(context).openEndDrawer();
                    },
                  ),
                ),
                DashboardTopWidget(
                  provider: provider,
                ),
                Container(
                  color: Colors.white,
                  margin: const EdgeInsets.all(ten),
                  height: size.height * zero4,
                  child: DashboardUserWidget(provider: provider),
                ),
                Container(
                  color: Colors.white,
                  margin: const EdgeInsets.all(ten),
                  height: size.height * zero4,
                  child: DashboardMapWidget(provider: provider),
                ),
                Container(
                  color: Colors.white,
                  margin: const EdgeInsets.all(ten),
                  alignment: Alignment.center,
                  height: size.height * zero3,
                  child: DashboardGraphWidget(
                    provider: provider,
                  ),
                ),
              ],
            ),
          );
        }),
      );
    });
  }
}
