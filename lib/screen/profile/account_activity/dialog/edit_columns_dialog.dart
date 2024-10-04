import 'package:flutter/material.dart';
import 'package:parsonskellogg/core/common/common_text_field_widget.dart';
import 'package:parsonskellogg/core/common/common_text_widget.dart';
import 'package:parsonskellogg/core/component/component.dart';
import 'package:parsonskellogg/core/constants/num_constants.dart';
import 'package:parsonskellogg/core/image_path/image_path.dart';
import 'package:parsonskellogg/core/string_utils/string_utils.dart';
import 'package:parsonskellogg/provider/profile_provider.dart';
import 'package:provider/provider.dart';

class EditColumnsDialog extends StatelessWidget {
  const EditColumnsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProfileProvider>(context);

    var size = MediaQuery.sizeOf(context);
    return Container(
      alignment: Alignment.center,
      width: size.width,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(twenty)),
      child: ListView(
        children: [
          _commonTitleView(context: context),
          const Divider(
            thickness: zero3,
          ),
          CommonTextFieldWidget(
            onChanged: (value) {
              context.read<ProfileProvider>().updateSearchTerm(value);
            },
            hint: search,
            left: ten,
            right: ten,
            prefixIcon: const Icon(
              Icons.search_rounded,
              color: Colors.grey,
            ),
          ),
          _listview(provider: provider),
        ],
      ),
    );
  }

  _commonTitleView({required BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: ten, vertical: zero),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
              child: CommonTextWidget(
            style: commonTextStyle(fontWeight: FontWeight.w600),
            text: editColumns,
          )),
          IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.close,
                color: Colors.grey,
              ))
        ],
      ),
    );
  }

  _listview({required ProfileProvider provider}) {
    final List<String> allColumns = [
      'PAGE',
      'MODULE',
      'EVENT',
      'USER',
      'DATE',
      'IP ADDRESS'
    ];
    final filteredColumns = provider.filteredColumns;
    return Column(
      children: [
        ListView.builder(
          primary: false,
          shrinkWrap: true,
          itemCount: filteredColumns.length,
          itemBuilder: (context, index) {
            final column = filteredColumns[index];
            return CheckboxListTile(
              dense: true,
              visualDensity: const VisualDensity(vertical: -3),
              title: CommonTextWidget(
                text: column,
                style: commonTextStyle(fontSize: ten),
              ),
              value: provider.columnsVisibility[column],
              onChanged: (bool? value) {
                provider.toggleColumn(column);
              },
            );
          },
        ),
        const Divider(
          thickness: zero3,
        ),
        // Right side: Dynamic view with consistent positions
        ListView.builder(
          primary: false,
          shrinkWrap: true,
          padding: const EdgeInsets.all(ten),
          itemCount: allColumns.length,
          itemBuilder: (context, index) {
            final column = allColumns[index];
            return Visibility(
              visible: provider.columnsVisibility[column]!,
              replacement: const SizedBox.shrink(),
              child: Container(
                margin: const EdgeInsets.all(five),
                decoration: commonBoxDecoration(
                    borderRadius: BorderRadius.circular(eight),
                    border: Border.all(
                        color: Colors.grey.withOpacity(zero20), width: one)),
                child: ListTile(
                  leading: loadAssetImage(
                      path: icDarkIndicator, width: twenty, height: twenty),
                  visualDensity: const VisualDensity(vertical: -4),
                  contentPadding: EdgeInsets.zero,
                  title: CommonTextWidget(
                    text: column,
                    style: commonTextStyle(fontSize: ten),
                  ),
                ),
              ), // Keeps the position but hides the content
            );
          },
        ),
      ],
    );
  }
}
