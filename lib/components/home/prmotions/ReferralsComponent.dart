import 'package:gpay/utils/DataProvider.dart';
import 'package:gpay/utils/Images.dart';
import 'package:gpay/model/Model.dart';
import 'package:gpay/utils/Colors.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class GPReferralsComponent extends StatefulWidget {
  static String tag = '/GPReferralsComponent';

  const GPReferralsComponent({super.key});

  @override
  GPReferralsComponentState createState() => GPReferralsComponentState();
}

class GPReferralsComponentState extends State<GPReferralsComponent> {
  List<GPContactModel> getContactList = getContactData();

  var searchController = TextEditingController();

  bool isEnable = false;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (isEnable) {
          hideKeyboard(context);
          isEnable = false;

          setState(() {});
          return false;
        }
        return !isEnable;
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color(0xFFe8ebfd),
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_outlined),
            onPressed: () {
              if (isEnable) {
                hideKeyboard(context);
                isEnable = false;

                setState(() {});
                return;
              }
              finish(context);
            },
          ),
          title: isEnable
              ? TextFormField(
                  controller: searchController,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[100],
                      contentPadding: const EdgeInsets.symmetric(vertical: 0),
                      border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(25.0))),
                      enabledBorder: OutlineInputBorder(borderRadius: const BorderRadius.all(Radius.circular(25.0)), borderSide: BorderSide(color: Colors.grey[300]!)),
                      focusedBorder: OutlineInputBorder(borderRadius: const BorderRadius.all(Radius.circular(25.0)), borderSide: BorderSide(color: Colors.grey[300]!)),
                      disabledBorder: OutlineInputBorder(borderRadius: const BorderRadius.all(Radius.circular(25.0)), borderSide: BorderSide(color: Colors.grey[300]!)),
                      hintText: 'Search Friends',
                      hintStyle: secondaryTextStyle(size: 12),
                      prefixIcon: const Icon(Icons.search, color: GPColorBlack)),
                  onTap: () {
                    //   hideKeyboard(context);
                  },
                )
              : const Text(""),
          actions: [
            IconButton(
              icon: isEnable ? Container() : const Icon(Icons.search, color: GPColorBlack),
              onPressed: () {
                isEnable = true;
                setState(() {});
              },
            ).visible(!isEnable)
          ],
        ),
        body: Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 16),
              decoration: const BoxDecoration(image: DecorationImage(image: AssetImage(GP_referral_bg), fit: BoxFit.cover)),
              height: 180,
              width: context.width(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("\u20B951 earned", style: primaryTextStyle(size: 26, color: GPColorBlack)),
                  10.height,
                  Text("For referring 1 friend", style: primaryTextStyle(size: 18, color: GPColorBlack)),
                ],
              ).paddingTop(10),
            ),
            ListView(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  height: context.height(),
                  margin: const EdgeInsets.only(top: 160),
                  decoration: boxDecorationWithRoundedCorners(backgroundColor: backgroundColor, borderRadius: radius(20), border: Border.all(color: backgroundColor)),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.blue[100],
                            radius: 20,
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              icon: const Icon(Icons.next_plan_outlined, color: GPAppColor),
                              color: Colors.white,
                              onPressed: () {},
                            ),
                          ),
                          10.width,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [Text("32y52b", style: primaryTextStyle(size: 14, color: GPColorBlack, weight: FontWeight.bold)), 3.height, Text("Your referral code", style: secondaryTextStyle(size: 12, color: GPColorBlack))],
                          ),
                          const Spacer(),
                          Text("Share", style: primaryTextStyle(size: 14, color: GPAppColor, weight: FontWeight.bold))
                        ],
                      ),
                      10.height,
                      Divider(color: Colors.grey[300], thickness: 1),
                      10.height,
                      referralContactList()
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget referralContactList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: getContactList.length,
      itemBuilder: (context, index) {
        GPContactModel mData = getContactList[index];
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(radius: 22, backgroundColor: Colors.white, backgroundImage: AssetImage(mData.userImg)),
            20.width,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(mData.userName, style: secondaryTextStyle(size: 12, color: GPColorBlack, weight: FontWeight.bold)),
                3.height,
                Text(mData.userPhoneNumber, style: secondaryTextStyle(size: 11, color: Colors.black54)),
              ],
            ).expand(),
            Text("Invite", style: primaryTextStyle(size: 14, color: GPAppColor, weight: FontWeight.bold))
          ],
        ).paddingBottom(20);
      },
    );
  }
}
