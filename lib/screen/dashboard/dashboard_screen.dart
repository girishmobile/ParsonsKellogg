
import 'package:flutter/material.dart';
import 'package:parsonskellogg/core/common/common_scaffold.dart';
import 'package:parsonskellogg/provider/dashboard_provider.dart';
import 'package:parsonskellogg/screen/profile/profile_view.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatelessWidget {
   DashboardScreen({super.key});


  Widget? childPage;
   void selectedPage({String? page}) {
     // do something
   }
  @override
  Widget build(BuildContext context) {
     var size=MediaQuery.sizeOf(context);
    return  CommonScaffold(
      onSelectedPage: (value) {
        Provider.of<DashboardProvider>(context, listen: false).updatePage(value??"profile");
      },
      child: SizedBox(
        width: size.width,
        height: size.height,
        child: Consumer<DashboardProvider>(
          builder: (context, pageNotifier, child) {
            return pageNotifier.currentPage; // Update child widget based on selected page
          },
        ),
      ),

    );

  }


}
