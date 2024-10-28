import 'package:flutter/material.dart';
import 'package:parsonskellogg/core/common/common_scaffold.dart';

import 'package:parsonskellogg/provider/dashboard_provider.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(builder: (context, provider, child) {
      return CommonScaffold(
        showDrawer: true,
        onSelectedPage: (String value) {
          print('dasdjlasjdlj $value');
          provider.updatePage = value;
        },
        child: provider.currentPage,
      );
    });
  }
}
