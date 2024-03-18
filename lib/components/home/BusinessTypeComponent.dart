import 'package:gpay/model/Model.dart';
import 'package:gpay/screens/ExploreScreen.dart';
import 'package:gpay/utils/Colors.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class BusinessTypeList extends StatefulWidget {
  static String tag = '/BusinessTypeList';
  List<GPBusinessTypeModel>? getBusinessTypeList;

  BusinessTypeList({super.key, this.getBusinessTypeList});

  @override
  BusinessTypeListState createState() => BusinessTypeListState();
}

class BusinessTypeListState extends State<BusinessTypeList> {
  int? tabIndex;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    tabIndex = 1;
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(5),
      scrollDirection: Axis.horizontal,
      itemCount: widget.getBusinessTypeList!.length,
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemBuilder: (context, index) {
        GPBusinessTypeModel mData = widget.getBusinessTypeList![index];
        return Container(
          decoration: BoxDecoration(border: Border.all(color: Colors.grey[300]!), borderRadius: const BorderRadius.all(Radius.circular(20))),
          child: Row(
            children: [Image.asset(mData.businessImg, height: 20, width: 20), 10.width, Text(mData.businessName, style: primaryTextStyle(size: 14, color: GPColorBlack))],
          ).paddingOnly(left: 10, right: 10),
        ).paddingOnly(left: 5, right: 5);
      },
    ).onTap(() {
      ExploreScreen(tabIndex: tabIndex).launch(context);
    });
  }
}
