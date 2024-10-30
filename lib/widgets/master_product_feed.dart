import 'package:flutter/material.dart';
import 'package:parsonskellogg/core/common/common_text_widget.dart';
import 'package:parsonskellogg/core/component/component.dart';
import 'package:parsonskellogg/screen/master_product_feed/model/master_feed_model.dart';

class MasterProductFeed extends StatelessWidget {
  const MasterProductFeed(
      {super.key, required this.masterFeedsArry, required this.title});

  final String title;
  final List<MasterFeedModel> masterFeedsArry;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
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
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: CommonTextWidget(
              text: title,
              textAlign: TextAlign.left,
              style: commonTextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: masterFeedsArry.length,
              itemBuilder: (ctx, masteriIndex) {
                final masterItemfeed = masterFeedsArry[masteriIndex];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _pageDivider(),
                    ListTile(
                      contentPadding:
                          const EdgeInsets.only(left: 20, right: 20),
                      dense: true,
                      visualDensity: const VisualDensity(vertical: -2),
                      title: Text(
                        masterItemfeed.name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    _pageDivider(),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 2.0,
                        mainAxisSpacing: 4.0,
                      ),
                      padding: const EdgeInsets.all(15.0),
                      itemCount: masterItemfeed.itemFeed.length,
                      itemBuilder: (contex, itemIndex) {
                        final itemFeed = masterItemfeed.itemFeed[itemIndex];

                        return Card(
                          elevation: 3,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.only(
                                      top: 10, left: 10, right: 10),
                                  child: Icon(
                                    itemFeed.iconName,
                                    size: 36,
                                    color: Colors.black.withOpacity(0.7),
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                width: double.infinity,
                                padding: const EdgeInsets.all(8),
                                color: const Color.fromRGBO(238, 242, 246, 1),
                                child:
                                    CommonTextWidget(text: itemFeed.name ?? ''),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    // for inner sub categoris
                    ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount:
                            masterFeedsArry[masteriIndex].coreItemFeed.length,
                        itemBuilder: (ctx, subIndex) {
                          final subcoreFeed = masterFeedsArry[masteriIndex]
                              .coreItemFeed[subIndex];
                          return Card(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 5),
                            child: ListTile(
                              title: CommonTextWidget(
                                text: subcoreFeed.count,
                                textAlign: TextAlign.left,
                                style: commonTextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              subtitle: CommonTextWidget(
                                text: subcoreFeed.name,
                                textAlign: TextAlign.left,
                                style: commonTextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              trailing: Icon(
                                subcoreFeed.iconName,
                                size: 32,
                                color: Colors.black.withOpacity(0.6),
                              ),
                            ),
                          );
                        })
                  ],
                );
              }),
        ],
      ),
    );
  }

  _pageDivider() {
    return Divider(
      color: Colors.black.withOpacity(0.7),
    );
  }
}
