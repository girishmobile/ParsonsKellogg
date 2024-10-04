
import 'package:flutter/material.dart';
import 'package:parsonskellogg/data/dummy_dashboar_items.dart';
import 'package:parsonskellogg/models/dashboard_item.dart';
import 'package:parsonskellogg/widgets/dashboard/dashboard_grid_item.dart';
class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    const List<DashboardItem> dashboardItems = dummyDashboardItems;

    return Center(
      child: GridView(
        padding: const EdgeInsets.all(20),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          // childAspectRatio: 3 / 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        children: [
          for (final item in dashboardItems)
            DashboardGridItem(
              dashBoardItem: item,
            )
        ],
      ),
    );
  }
}
