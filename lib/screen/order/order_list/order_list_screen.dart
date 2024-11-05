import 'package:flutter/material.dart';
import 'package:parsonskellogg/core/color/color.dart';
import 'package:parsonskellogg/core/common/common_text_field_widget.dart';
import 'package:parsonskellogg/core/common/common_text_widget.dart';
import 'package:parsonskellogg/core/component/component.dart';
import 'package:parsonskellogg/core/constants/num_constants.dart';
import 'package:parsonskellogg/core/image_path/image_path.dart';
import 'package:parsonskellogg/core/string_utils/string_utils.dart';
import 'package:parsonskellogg/provider/profile_provider.dart';
import 'package:parsonskellogg/screen/order/order_list/order_list_common_page.dart';
import 'package:parsonskellogg/screen/profile/account_activity/dialog/edit_columns_dialog.dart';

class OrderListScreen extends StatefulWidget {
  const OrderListScreen({super.key});

  @override
  State<OrderListScreen> createState() => _OrderListScreenState();
}

class _OrderListScreenState extends State<OrderListScreen>  with SingleTickerProviderStateMixin {
  //late TabController _tabController;

  final _selectedColor = colorBg;
  final _unselectedColor = const Color(0xff5f6368);
  final _tabs = [
    const Tab(text: 'New'),
    const Tab(text: 'Phone Order'),
    const Tab(text: ' Synced With BC'),
    const Tab(text: 'Pending In BC'),
    const Tab(text: 'Shipped'),
    const Tab(text: 'Cancelled Orders'),
    const Tab(text: 'All'),
  ];

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.sizeOf(context);
    return Container(
      color: Colors.white,
      width: size.width,
      height: size.height,
      margin: const EdgeInsets.all(10),
      child: DefaultTabController(
        length: _tabs.length,
        child: Column(

          mainAxisSize: MainAxisSize.min,
          children: [
           Container(
             margin: const EdgeInsets.all(8),
             child:  _topView(context: context),
           ),

            Container(
            margin: const EdgeInsets.all(5),
              padding:
              const EdgeInsets.only(top: 2.0, right: 2.0, left: 2.0),
              decoration: const BoxDecoration(
                color: colorBg,

                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8.0),
                    topRight: Radius.circular(8.0)),
              ),
              child: TabBar(

                unselectedLabelStyle: commonTextStyle(fontSize: 12,fontWeight: FontWeight.w400),
                labelStyle: commonTextStyle(fontSize: 12,fontWeight: FontWeight.w400),
                indicatorSize: TabBarIndicatorSize.tab,

                isScrollable: true,

                indicator: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8.0),
                        topRight: Radius.circular(8.0)),
                    color: Colors.white),
                labelColor: Colors.black,
                unselectedLabelColor: Colors.black,
                tabs: _tabs,
              ),
            ),
            const Expanded(child: TabBarView(children: [
              OrderListCommonPage(),
              OrderListCommonPage(),
              OrderListCommonPage(),
              OrderListCommonPage(),
              OrderListCommonPage(),
              OrderListCommonPage(),
              OrderListCommonPage(),

            ]))
          ],
        ),
      ),
    );
  }

  _topView({required BuildContext context, }) {
    var size = MediaQuery.sizeOf(context);
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        const Row(
          mainAxisSize: MainAxisSize.min,
          children: [


            Expanded(
                child: SizedBox(
                  height: 40,
                  child: CommonTextFieldWidget(
                    borderRadius: 8,
                    prefixIcon: Icon(
                      Icons.search,
                      size: 20,
                      color: Colors.grey,
                    ),
                    colorFill: Colors.white,
                    hint: "Search",
                  ),
                ))
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildIconContainer(
                onTap: () {
                  showAlertDialog(
                      dialogHeight: size.height * 0.7,
                      dialogWidth: size.width * 0.9,
                      context: context,
                      child: const EditColumnsDialog());
                },
                context: context,
                icon: icEditColum,
                label: editColumns),

            const SizedBox(width: 5,),
            buildIconContainer(
                onTap: () {},
                context: context,
                icon: icDownload,
                label: download),
            const SizedBox(width: 5,),
            Expanded(child:  buildIconContainer(
              onTap: () {},
              context: context,
              label: save,
              icon: icRefresh,
            ),),
            const SizedBox(width: 5,),
            buildIconContainer(
              onTap: () {},
              context: context,
              icon: icRefresh,
            ),


          ],
        ),

        Row(
          children: [
            buildIconContainer(
              onTap: () {},
              context: context,
              label: moreFilter,
              icon: icFilter,
            ),
            const SizedBox(
              width: 10,
            ),

          ],
        )
      ],
    );
  }


  Widget buildIconContainer(
      {required BuildContext context,
        String? icon,
        String? label,
        VoidCallback? onTap}) {
    return commonInkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(top: ten),
        padding: const EdgeInsets.all(ten),
        decoration: commonBoxDecoration(
            border:
            Border.all(color: Colors.grey.withOpacity(zero20), width: one),
            borderRadius: BorderRadius.circular(five)),
        child: Row(
          children: [
            loadAssetImage(
                path: icon ?? icEditColum,
                width: twentyFour,
                colorIcon: Colors.grey,

                height: twentyFour),
            CommonTextWidget(
              left: five,
              text: label,
              style: commonTextStyle(fontSize: 10, color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
  commonCardView({
    Widget? child,
  }) {
    return Container(
      // padding: const EdgeInsets.all(10),
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
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: CommonTextFieldWidget(
              hint: "Search",
              prefixIcon: Icon(Icons.search,size: 20,),
            ),
          ),
          const Divider(
            height: 5,
          ),
          child ?? const SizedBox.shrink()
        ],
      ),
    );
  }
}
