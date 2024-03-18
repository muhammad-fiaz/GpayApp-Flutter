import 'package:gpay/components/peopleAndBills/mobileRecharge/ProcessToPayComponent.dart';
import 'package:gpay/model/Model.dart';
import 'package:gpay/utils/Colors.dart';
import 'package:gpay/utils/DataProvider.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class GPRechargeTapComponent extends StatefulWidget {
  static String tag = '/GPRechargeTapComponent';

  const GPRechargeTapComponent({super.key});

  @override
  GPRechargeTapComponentState createState() => GPRechargeTapComponentState();
}

class GPRechargeTapComponentState extends State<GPRechargeTapComponent> with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  TabController? _tabController;
  List<GPRechargeForYouModel> getRechargeData = getForYouRechargeData();
  List<GPRechargeDataModel> getRechargeSpecialData = getRechargeDataModel();
  List<GPRechargeDataModel> getRechargeOtherData = getOtherRechargeModel();

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    _tabController = TabController(length: 7, vsync: this);
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return DefaultTabController(
      length: 7,
      child: Scaffold(
        body: Column(
          children: [
            TabBar(
              isScrollable: true,
              controller: _tabController,
              unselectedLabelColor: Colors.black54,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: GPAppColor,
              labelColor: GPAppColor,
              labelStyle: secondaryTextStyle(size: 12, weight: FontWeight.bold, color: GPColorBlack),
              tabs: const [
                Tab(text: "FOR YOU"),
                Tab(text: "RECOMMENDED"),
                Tab(text: "DATA"),
                Tab(text: "SPECIAL RECHARGE"),
                Tab(text: "ROAMING"),
                Tab(text: "TOP-UP"),
                Tab(text: "OTHERS"),
              ],
            ),
            TabBarView(
                controller: _tabController,
                physics: const NeverScrollableScrollPhysics(),
                children: [rechargeListView(), rechargeListView(), rechargeSpecialDataListView(), rechargeListView(), rechargeSpecialDataListView(), rechargeOtherDataListView(), rechargeOtherDataListView()]).expand(),
          ],
        ),
      ),
    );
  }

  Widget rechargeListView() {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return Divider(
          color: Colors.grey[400],
        ).paddingOnly(right: 20, left: 20);
      },
      scrollDirection: Axis.vertical,
      itemCount: getRechargeData.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        GPRechargeForYouModel mData = getRechargeData[index];
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('\u{20B9} ${mData.rechargeAmount}', style: primaryTextStyle(size: 22, color: GPColorBlack)),
            14.width,
            Text(mData.offer, style: secondaryTextStyle(size: 13)).expand(),
            5.width,
            const Icon(Icons.navigate_next_outlined, color: Colors.grey).onTap(() {})
          ],
        ).paddingAll(20).onTap(() {
          GpProcessToPayComponent(rechargeAmount: mData.rechargeAmount).launch(context);
        });
      },
    );
  }

  Widget rechargeSpecialDataListView() {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return Divider(
          color: Colors.grey[400],
        ).paddingOnly(right: 20, left: 20);
      },
      padding: const EdgeInsets.all(20),
      scrollDirection: Axis.vertical,
      itemCount: getRechargeSpecialData.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        GPRechargeDataModel mData = getRechargeSpecialData[index];
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('\u{20B9} ${mData.rechargeAmount}', style: primaryTextStyle(size: 22, color: GPColorBlack)),
            14.width,
            listItemColumnWidget(mData.validity, mData.offers).expand(),
            5.width,
            const Icon(Icons.navigate_next_outlined, color: Colors.grey).onTap(() {})
          ],
        ).paddingAll(20);
      },
    );
  }

  Widget rechargeOtherDataListView() {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return Divider(
          color: Colors.grey[400],
        ).paddingOnly(right: 20, left: 20);
      },
      padding: const EdgeInsets.all(20),
      scrollDirection: Axis.vertical,
      itemCount: getRechargeOtherData.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        GPRechargeDataModel mData = getRechargeOtherData[index];
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('\u{20B9} ${mData.rechargeAmount}', style: primaryTextStyle(size: 22, color: GPColorBlack)),
            14.width,
            listItemColumnWidget(mData.validity, mData.offers).expand(),
            5.width,
            const Icon(Icons.navigate_next_outlined, color: Colors.grey).onTap(() {})
          ],
        ).paddingAll(20);
      },
    );
  }

  Widget listItemColumnWidget(String validity, String offers) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text("Validity:", style: primaryTextStyle(size: 12, weight: FontWeight.bold, color: GPColorBlack)),
            5.width,
            Text(validity, style: primaryTextStyle(size: 12, weight: FontWeight.bold, color: GPColorBlack)),
          ],
        ),
        5.height,
        Text(offers, style: secondaryTextStyle(size: 13)),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
