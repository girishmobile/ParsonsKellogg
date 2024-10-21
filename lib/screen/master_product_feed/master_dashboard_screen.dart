import 'package:flutter/material.dart';
import 'package:parsonskellogg/core/common/common_text_widget.dart';
import 'package:parsonskellogg/core/component/component.dart';
import 'package:parsonskellogg/core/image_path/image_path.dart';
import 'package:parsonskellogg/screen/master_product_feed/dummy_data.dart';
import 'package:parsonskellogg/screen/master_product_feed/model/master_feed_model.dart';

class MasterDashboardScreen extends StatelessWidget {
  const MasterDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(238, 243, 248, 1),
        body: ListView(
          // padding: const EdgeInsets.only(top: 0, bottom: 10),
          children: [
            _commonTopTable('Product Database', productDatabase),
            _commonTopTable('Core Product Feed', coreProductFeed),
            _storeBuilderWithGrid('Ecommerce', ecommerceStore),
            _storeBuilderWithGrid('Corporate Store', corporateStore),
            _storeBuilderWithGrid('Store Builder', storeBuilder),
            _storeBuilderWithGrid('Form Builder', formBuilder),
            _masterFeedBinding('Master Product Feed', masterFeedsData),
          ],
        ));
  }

  _commonTopTable(String title, List<Map<String, String>> dataAry) {
    return Container(
      padding: const EdgeInsets.only(bottom: 5),
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
        crossAxisAlignment: CrossAxisAlignment.center,
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
          ...List.generate(dataAry.length, (index) {
            final product = dataAry[index];
            return Column(
              children: [
                ListTile(
                  dense: true,
                  visualDensity: const VisualDensity(vertical: -2),
                  title: Text(product['name'] ?? ''),
                  trailing: Text(product['count'] ?? '0'),
                ),
                // Show Divider only if it's not the last item
                if (index < dataAry.length - 1)
                  const Divider(
                    color: Colors.black,
                  ),
              ],
            );
          }),
        ],
      ),
    );
  }

  _formBuilderBinding(
      String title, List<Map<String, dynamic>> formbuilderList) {
    return Container(
      margin: const EdgeInsets.all(10),
      // height: 400,
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
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 2.0,
          mainAxisSpacing: 4.0,
        ),
        padding: const EdgeInsets.all(15.0),
        itemCount: formbuilderList.length,
        itemBuilder: (contex, index) {
          final formStore = formbuilderList[index];

          return Card(
            elevation: 4,
            child: Stack(
              children: [
                Image.asset(
                  icLogo,
                  fit: BoxFit.contain,
                ),
                // Container(
                //   alignment: Alignment.center,
                //   width: double.infinity,
                //   padding: const EdgeInsets.all(8),
                //   color: const Color.fromRGBO(238, 242, 246, 1),
                //   child: CommonTextWidget(text: formStore['name'] ?? ''),
                // ),
              ],
            ),
          );
        },
      ),
    );
  }

  _storeBuilderWithGrid(String title, List<Map<String, dynamic>> storeList) {
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
            itemCount: storeList.length,
            itemBuilder: (contex, index) {
              final store = storeList[index];

              return Card(
                elevation: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        padding:
                            const EdgeInsets.only(top: 10, left: 10, right: 10),
                        child: Image.asset(
                          icLogo,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      padding: const EdgeInsets.all(8),
                      color: const Color.fromRGBO(238, 242, 246, 1),
                      child: CommonTextWidget(text: store['name'] ?? ''),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  _pageDivider() {
    return Divider(
      color: Colors.black.withOpacity(0.7),
    );
  }

  _masterFeedBinding(String title, List<MasterFeedModel> masterFeedsArry) {
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
}
/**
 * 
 * Column(
              children: [
                ListTile(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 40),
                  title: Text(product['name'] ?? ''),
                  trailing: Text(product['count'] ?? '0'),
                ),
                const Divider(
                  color: Colors.black,
                )
              ],
            );

             ...dataAry.map((product) {
            return Column(
              children: [
                ListTile(
                  dense: true,
                  visualDensity: const VisualDensity(vertical: -2),
                  title: Text(product['name'] ?? ''),
                  trailing: Text(product['count'] ?? '0'),
                ),
                const Divider(
                  color: Colors.black,
                )
              ],
            );
          }),


          _storeListBinding(String title, List<Map<String, dynamic>> storeList) {
    return Container(
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
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
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
          const Divider(
            color: Colors.black,
          ),
        
          const SizedBox(height: 10),
          ...List.generate(storeList.length, (index) {
            final store = storeList[index];
            return Container(
              height: 130,
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  color: Colors.grey.withOpacity(0.4), // Border color
                  width: 1, // Border width
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Image.asset(
                      icLoginLogo,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    padding: const EdgeInsets.all(8),
                    color: const Color.fromRGBO(238, 242, 246, 1),
                    child: CommonTextWidget(text: store['name'] ?? ''),
                  ),
                ],
              ),
            );
          })
        ],
      ),
    );
  }
 */
