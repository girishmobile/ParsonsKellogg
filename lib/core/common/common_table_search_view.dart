import 'package:flutter/material.dart';
import 'package:parsonskellogg/core/common/common_text_field_widget.dart';
import 'package:parsonskellogg/core/common/common_text_widget.dart';
import 'package:parsonskellogg/core/component/component.dart';
import 'package:parsonskellogg/core/constants/num_constants.dart';
import 'package:parsonskellogg/core/image_path/image_path.dart';
import 'package:parsonskellogg/core/string_utils/string_utils.dart';
import 'package:parsonskellogg/provider/profile_provider.dart';
import 'package:parsonskellogg/screen/profile/account_activity/dialog/edit_columns_dialog.dart';

class CommonTableSearchView extends StatelessWidget {
  const CommonTableSearchView({super.key, required this.tetSearch, this.onChanged});

  final TextEditingController tetSearch;

  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonTextWidget(
          text: accountActivity,
          left: twenty,
          top: twenty,
          style:
              commonTextStyle(fontSize: sixteen, fontWeight: FontWeight.w700),
        ),
        _searchBox(size: size, controller: tetSearch, onChanged: onChanged),
        LayoutBuilder(builder: (context, constraints) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildIconContainer(
                onTap: (){
                  showAlertDialog(
                      dialogHeight: size.height*0.7,
                      dialogWidth:size.width*0.9 ,
                      context: context, child: const EditColumnsDialog());
                },
                  context: context, icon: icEditColum, label: editColumns),
              buildIconContainer(
                  context: context, icon: icDownload, label: download),
              buildIconContainer(context: context, icon: icRefresh),


            ],
          );
        }),
        Row(
          children: [
            SizedBox(

              child: buildIconContainer(
                  context: context, icon: icFilter, label: moreFilter),
            ),
            SizedBox(width: 20,),
            buildIconContainer(
                context: context, icon: icDownload, label: save),
          ],
        )
      ],
    );
  }

  _searchBox(
      {required Size size,
      TextEditingController? controller,
      void Function(String)? onChanged}) {
    return CommonTextFieldWidget(
      hint: search,
      controller: controller,
      top: size.height * zero02,
      onChanged: onChanged,
      hintStyle: commonTextStyle(color: Colors.grey),
      prefixIcon: Icon(
        Icons.search_rounded,
        color: Colors.grey.withOpacity(zero50),
      ),
    );
  }

  Widget buildIconContainer(
      {required BuildContext context, String? icon, String? label,VoidCallback? onTap}) {
    return commonInkWell(
      onTap:onTap ,
      child: Container(
        margin: const EdgeInsets.only(top: ten),
        padding: const EdgeInsets.all(ten),
        decoration: commonBoxDecoration(
            border: Border.all(color: Colors.grey.withOpacity(zero20), width: one),
            borderRadius: BorderRadius.circular(five)),
        child: Row(
          children: [
            loadAssetImage(path: icon ?? icEditColum, width: twentyFour, height: twentyFour),
            CommonTextWidget(
              left: five,

              text: label,
              style: commonTextStyle(fontSize: eleven, color: Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
