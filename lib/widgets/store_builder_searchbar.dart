import 'package:flutter/material.dart';
import 'package:parsonskellogg/core/common/common_drop_down_view.dart';
import 'package:parsonskellogg/core/common/common_text_widget.dart';

class StoreBuilderSearchbar extends StatelessWidget {
  const StoreBuilderSearchbar({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            child: CommonTextWidget(
              text: title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.black.withOpacity(0.8),
              ),
            ),
          ),
          Expanded(
            child: CommonDropDownView(
                selectedValue: 'All Store',
                onChanged: (value) {},
                size: MediaQuery.sizeOf(context),
                items: const [
                  'All Store',
                  'ParsonsKellogg',
                  'Boston',
                  'Gameday Gear',
                  'USA',
                  'POLO'
                ]),
          ),
        ],
      ),
    );
  }
}
