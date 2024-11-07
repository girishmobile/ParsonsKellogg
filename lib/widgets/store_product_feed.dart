import 'package:flutter/material.dart';
import 'package:parsonskellogg/core/common/common_text_widget.dart';
import 'package:parsonskellogg/core/component/component.dart';
import 'package:parsonskellogg/screen/master_product_feed/model/master_feed_model.dart';

class StoreProductFeed extends StatelessWidget {
  const StoreProductFeed(
      {super.key, required this.title, required this.storeFeedData});

  final String title;
  final List<ItemFeed> storeFeedData;

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
          _pageDivider(),
          GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 2.0,
                mainAxisSpacing: 4.0,
              ),
              padding: const EdgeInsets.all(15.0),
              itemCount: storeFeedData.length,
              itemBuilder: (contex, itemIndex) {
                final itemFeed = storeFeedData[itemIndex];
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
                      _pageDivider(),
                      CommonTextWidget(
                        text: itemFeed.count,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      _pageDivider(),
                      Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        padding: const EdgeInsets.all(8),
                        //color: const Color.fromRGBO(238, 242, 246, 1),
                        child: CommonTextWidget(
                          text: itemFeed.name,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                );
              })
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
