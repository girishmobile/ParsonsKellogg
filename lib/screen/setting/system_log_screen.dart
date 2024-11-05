import 'package:flutter/cupertino.dart';
import 'package:parsonskellogg/screen/profile/system_log/system_log_view.dart';

class SystemLogScreen extends StatelessWidget {
  const SystemLogScreen({super.key});

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
            padding: EdgeInsets.all(5.0),
            child: SystemLogView(title: "System Log",),
          ),
        ],
      ),
    );
  }
}
