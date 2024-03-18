import 'package:gpay/components/commanWidget/ImageWithTitleWidget.dart';
import 'package:gpay/components/peopleAndBills/LinkComponent.dart';
import 'package:gpay/model/Model.dart';
import 'package:gpay/utils/Colors.dart';
import 'package:gpay/utils/DataProvider.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class DthDetailsComponent extends StatefulWidget {
  static String tag = '/DthDetailsComponent';
  final int? index;
  final String? titleData;

  const DthDetailsComponent({super.key, this.index, this.titleData});

  @override
  DthDetailsComponentState createState() => DthDetailsComponentState();
}

class DthDetailsComponentState extends State<DthDetailsComponent> {
  late List<GPDthDetailsModel> gpDthData;
  String? titleData;
  int? index;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    index = widget.index;
    titleData = widget.titleData;
    if (index == 0) {
      gpDthData = getDthDetailsData();
    } else if (index == 1) {
      gpDthData = getElectricityDetailsData();
    } else if (index == 2) {
      gpDthData = getPostPaidMobileData();
    } else if (index == 3) {
      gpDthData = getPlayStoreData();
    } else if (index == 4) {
      gpDthData = getBroadBandData();
    }
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: Text(titleData!, style: primaryTextStyle(size: 14, color: GPColorBlack, weight: FontWeight.bold)),
        actions: [
          PopupMenuButton(
            icon: const Icon(Icons.more_vert_outlined, color: GPColorBlack),
            onSelected: (dynamic v) {
              toast('Click');
            },
            itemBuilder: (BuildContext context) {
              List<PopupMenuEntry<Object>> list = [];
              list.add(
                const PopupMenuItem(
                  value: 1,
                  child: Text("Send feedback", style: TextStyle(color: GPColorBlack)),
                ),
              );
              return list;
            },
          )
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 10),
        scrollDirection: Axis.vertical,
        itemCount: gpDthData.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          GPDthDetailsModel data = gpDthData[index];
          return Column(
            children: [
              ImageWithTitleWidget(gpDthData[index].img, gpDthData[index].name, gpDthData[index].title),
            ],
          ).onTap(() {
            DthLinkComponent(dthListData: data).launch(context);
          });
        },
      ),
    );
  }
}
