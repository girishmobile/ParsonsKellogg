import 'package:flutter/cupertino.dart';
import 'package:parsonskellogg/screen/profile/account_activity/account_activity_view.dart';
import 'package:parsonskellogg/screen/profile/system_log/system_log_view.dart';
class ActivityLogScreen extends StatelessWidget {
  const ActivityLogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.sizeOf(context);
    return  SizedBox(
      width: size.width,
      height: size.height,
      child: ListView(
        shrinkWrap: false,
        children: const [


          Padding(
            padding: EdgeInsets.all(10.0),
            child: AccountActivityView(),
          ),
        ],
      ),
    );
  }
}
