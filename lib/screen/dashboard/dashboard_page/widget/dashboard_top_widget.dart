import 'package:flutter/material.dart';
import 'package:parsonskellogg/core/component/component.dart';
import 'package:parsonskellogg/core/constants/num_constants.dart';
import 'package:parsonskellogg/models/dashboard_item.dart';
import 'package:parsonskellogg/provider/dashboard_provider.dart';

class DashboardTopWidget extends StatelessWidget {
  const DashboardTopWidget({super.key, required this.provider});

  final DashboardProvider provider;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      primary: false,
      itemCount: provider.dashboardItem.length,
      shrinkWrap: true,
      padding: const EdgeInsets.all(ten),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 16,
      ),
      itemBuilder: (BuildContext context, int index) {
        return DashboardGridItem(dashBoardItem: provider.dashboardItem[index]);
      },
    );
  }
}

class DashboardGridItem extends StatelessWidget {
  const DashboardGridItem({super.key, required this.dashBoardItem});

  final DashboardItem dashBoardItem;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      splashColor: Theme.of(context).colorScheme.surface,
      child: Container(
        padding: const EdgeInsets.all(sixteen),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 2,
              offset: const Offset(0, 2),
            )
          ],
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.surface,
              Theme.of(context).colorScheme.surface,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              dashBoardItem.iconName,
              size: twentyEight,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            commonText(
                textAlign: TextAlign.center,
                text: dashBoardItem.title,
                fontSize: fourteen,
                fontWeight: FontWeight.w600),
            commonText(
              textAlign: TextAlign.center,
              fontSize: ten,
              colorText: Colors.grey,
              fontWeight: FontWeight.w600,
              text: dashBoardItem.subTitle,
            ),
          ],
        ),
      ),
    );
  }
}
