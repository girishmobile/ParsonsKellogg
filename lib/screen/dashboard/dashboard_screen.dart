import 'package:flutter/material.dart';
import 'package:parsonskellogg/core/common/common_scaffold.dart';
import 'package:parsonskellogg/data/dummy_dashboar_items.dart';
import 'package:parsonskellogg/models/dashboard_item.dart';
import 'package:parsonskellogg/widgets/dashboard/dashboard_grid_item.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  final List<DashboardItem> _dashboardItems = dummyDashboardItems;

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      showDrawer: true,
      child: Center(
        child: GridView(
          padding: const EdgeInsets.all(20),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            // childAspectRatio: 3 / 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          children: [
            for (final item in _dashboardItems)
              DashboardGridItem(
                dashBoardItem: item,
              )
          ],
        ),
      ),
    );
  }
}
