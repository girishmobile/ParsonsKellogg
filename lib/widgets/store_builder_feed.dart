import 'package:flutter/material.dart';
import 'package:parsonskellogg/core/common/common_text_widget.dart';
import 'package:parsonskellogg/core/component/component.dart';
import 'package:parsonskellogg/screen/master_product_feed/model/master_feed_model.dart';

class StoreBuilderFeed extends StatelessWidget {
  const StoreBuilderFeed(
      {super.key, required this.title, required this.storeBuilFeedData});
  final String title;
  final List<ItemFeed> storeBuilFeedData;
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
              itemCount: storeBuilFeedData.length,
              itemBuilder: (contex, itemIndex) {
                final itemFeed = storeBuilFeedData[itemIndex];
                return Card(
                  elevation: 3,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(height: 20),
                        Icon(
                          itemFeed.iconName,
                          size: 36,
                          color: Colors.black.withOpacity(0.7),
                        ),
                        _pageDivider(),
                        CommonTextWidget(
                          text: itemFeed.count,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        _pageDivider(),
                        CommonTextWidget(
                          left: 20,
                          right: 20,
                          maxLines: 2,
                          text: itemFeed.name,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10)
                      ],
                    ),
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
