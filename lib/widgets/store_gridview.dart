import 'package:flutter/material.dart';
import 'package:parsonskellogg/core/common/common_text_widget.dart';
import 'package:parsonskellogg/core/component/component.dart';
import 'package:parsonskellogg/core/image_path/image_path.dart';

class StoreGridview extends StatelessWidget {
  const StoreGridview(
      {super.key, required this.title, required this.storeList});

  final String title;
  final List<Map<String, dynamic>> storeList;

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
}
