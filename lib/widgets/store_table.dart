import 'package:flutter/material.dart';
import 'package:parsonskellogg/core/common/common_text_widget.dart';
import 'package:parsonskellogg/core/component/component.dart';

class StoreTable extends StatelessWidget {
  const StoreTable({super.key, required this.title, required this.tableData});

  final String title;
  final List<Map<String, String>> tableData;

  @override
  Widget build(BuildContext context) {
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
          ...List.generate(tableData.length, (index) {
            final product = tableData[index];
            return Column(
              children: [
                ListTile(
                  dense: true,
                  visualDensity: const VisualDensity(vertical: -2),
                  title: Text(
                    product['name']?.toUpperCase() ?? '',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Colors.black.withOpacity(0.7),
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                  trailing: Text(
                    product['count'] ?? '0',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Colors.black.withOpacity(0.7),
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                ),
                // Show Divider only if it's not the last item
                if (index < tableData.length - 1)
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

  _pageDivider() {
    return Divider(
      color: Colors.black.withOpacity(0.7),
    );
  }
}
