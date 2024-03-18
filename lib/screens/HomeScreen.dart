import 'package:gpay/components/home/BusinessComponent.dart';
import 'package:gpay/components/home/BusinessTypeComponent.dart';
import 'package:gpay/components/home/AllPaymentActivityComponent.dart';
import 'package:gpay/components/home/HomeComponent.dart';
import 'package:gpay/components/home/PromotionsComponent.dart';
import 'package:gpay/components/home/profile/ProfileComponent.dart';
import 'package:gpay/model/Model.dart';
import 'package:gpay/screens/ExploreScreen.dart';
import 'package:gpay/utils/AppWidget.dart';
import 'package:gpay/utils/Colors.dart';
import 'package:gpay/utils/DataProvider.dart';
import 'package:gpay/utils/Images.dart';
import 'package:gpay/utils/String.dart';
import 'package:gpay/utils/Widgets.dart';
import 'package:gpay/utils/stretchy_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:share/share.dart';

import 'QrScannerComponent.dart';

class GPHomeScreen extends StatefulWidget {
  static String tag = '/GPHomeScreen';
  final GPPeopleModel? data;

  const GPHomeScreen({super.key, this.data});

  @override
  GPHomeScreenState createState() => GPHomeScreenState();
}

class GPHomeScreenState extends State<GPHomeScreen> {
  ScrollController scrollController = ScrollController();

  List<GPChatModel> getPeopleList = getChatData();
  List<GPBusinessTypeModel> getBusinessTypeList = getBusinessTypeData();
  List<GPPeopleModel> getBusinessList = getBusinessData();
  List<GPPeopleModel> getPromotionsList = getPromotionsData();

  int? tabIndex;
  double lastScrollPosition = 1.0;

  bool isNewPaymentHide = true;
  bool isShow = true;
  bool isProfileScreenCalled = false;

  bool mIsScrollingDown = false;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    tabIndex = 0;

    scrollController.addListener(() {
      log(isNewPaymentHide);

      if (scrollController.position.userScrollDirection == ScrollDirection.reverse) {
        if (!mIsScrollingDown) {
          mIsScrollingDown = true;
          isNewPaymentHide = false;
        }
      }
      if (scrollController.position.userScrollDirection == ScrollDirection.forward) {
        if (mIsScrollingDown) {
          mIsScrollingDown = false;
          isNewPaymentHide = true;
        }
      }

      setState(() {});
    });

    LiveStream().on(Gp_stream, (sn) {
      double pixels = (sn as ScrollNotification).metrics.pixels;
      if (pixels < lastScrollPosition) {
        if (pixels < -150) {
          if (!isProfileScreenCalled) {
            isProfileScreenCalled = true;

            callProfileScreen();
          }
        }
      } else {}
      setState(() {});
      //lastScrollPosition = pixels;
    });
  }

  Future<void> callProfileScreen() async {
    await const GPProfileComponent().launch(context);

    isProfileScreenCalled = false;
    setState(() {});
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
    LiveStream().dispose(Gp_stream);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,
        leading: IconButton(
          icon: Image.asset(GP_qr_home_icon, height: 22, width: 22, color: GPColorBlack),
          onPressed: () {
            GPQrScannerComponent().launch(context);
          },
        ),
        actions: [
          Hero(tag: 'profile', child: const CircleAvatar(backgroundImage: AssetImage(GPAY_user), radius: 15).paddingRight(10)).onTap(() {
            callProfileScreen();
          }),
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          StretchyHeader.singleChild(
            headerData: HeaderData(
              headerHeight: 250,
              header: Image.asset(GP_game_bg, fit: BoxFit.cover),
              highlightHeaderAlignment: HighlightHeaderAlignment.bottom,
              highlightHeader: Container(
                height: 20,
                width: MediaQuery.of(context).size.width,
                decoration: boxDecorationWithRoundedCorners(backgroundColor: backgroundColor, borderRadius: radiusOnly(topRight: 24, topLeft: 24)),
              ),
            ),
            child: ListView(
              shrinkWrap: true,
              controller: scrollController,
              children: [
                Container(
                  decoration: BoxDecoration(border: Border.all(color: backgroundColor), borderRadius: const BorderRadius.all(Radius.circular(20))),
                  child: Column(
                    children: [
                      Container(height: 2, width: 25, color: Colors.grey[300]).paddingTop(10),
                      10.height,
                      Align(alignment: Alignment.centerLeft, child: Text('People', style: primaryTextStyle(size: 20, color: GPColorBlack)).paddingLeft(20)),
                      15.height,
                      HomeListComponent(getPeopleList: getPeopleList),
                      20.height,
                      const MySeparator(color: Colors.grey).paddingOnly(left: 20, right: 20),
                      20.height,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Business and bills', style: primaryTextStyle(size: 20, color: GPColorBlack)),
                          ElevatedButton.icon(
                            onPressed: () {
                              ExploreScreen(tabIndex: 0).launch(context);
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: GPAppColor, backgroundColor: GPLightBlue, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
                              elevation: 0,
                              splashFactory: NoSplash.splashFactory,
                            ),
                            label: Text('Explore', style: primaryTextStyle(size: 14, color: GPAppColor)),
                            icon: const Icon(Icons.shopping_bag, color: GPAppColor),
                          ),

                        ],
                      ).paddingOnly(left: 20, right: 20),
                      15.height,
                      SizedBox(height: 45, width: context.width(), child: BusinessTypeList(getBusinessTypeList: getBusinessTypeList)),
                      20.height,
                      BusinessList(getBusinessList: getBusinessList),
                      20.height,
                      const MySeparator(color: Colors.grey).paddingOnly(left: 20, right: 20),
                      20.height,
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Promotions', style: primaryTextStyle(size: 20, color: GPColorBlack)).paddingLeft(20),
                      ),
                      20.height,
                      PromotionsList(getPromotionsList: getPromotionsList),
                      20.height,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.av_timer_sharp, color: GPAppColor),
                          10.width,
                          Text("See all payments activity", style: primaryTextStyle(size: 14, color: GPColorBlack, weight: FontWeight.bold)),
                          const Spacer(),
                          const Icon(Icons.navigate_next, color: GPColorBlack),
                        ],
                      ).paddingOnly(left: 20, right: 20).onTap(() {
                        const GPAllPaymentActivityComponent().launch(context);
                      }),
                      34.height,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.account_balance_outlined, color: GPAppColor),
                          10.width,
                          Text("Check account balance", style: primaryTextStyle(size: 14, color: GPColorBlack, weight: FontWeight.bold)),
                          const Spacer(),
                          const Icon(Icons.navigate_next, color: GPColorBlack),
                        ],
                      ).paddingOnly(left: 20, right: 20),
                      20.height,
                      Stack(
                        children: [
                          commonCacheImageWidget(GP_footer, fit: BoxFit.cover, height: 280, width: context.width()),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Invite your friends", style: primaryTextStyle(size: 16, color: GPColorBlack, weight: FontWeight.bold)),
                              5.height,
                              Text('${"Get "}\u{20B9}${"201 after each friend's first payment"}', style: primaryTextStyle(size: 14, color: GPColorBlack)),
                              10.height,
                              ElevatedButton(
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(color: Colors.grey[300]!),
                                    ),
                                  ),
                                  backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                  foregroundColor: MaterialStateProperty.all<Color>(GPColorBlack),
                                ),
                                onPressed: () async {
                                  await Share.share('Get \u{20B9}201 after each friend\'s first payment');
                                },
                                child: const Text("Invite", style: TextStyle(fontSize: 12.0)),
                              ),

                            ],
                          ).paddingAll(30),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: GPAppColor,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28.0)),
              elevation: 10,
            ),
            onPressed: () {
              ExploreScreen().launch(context);
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.add, color: backgroundColor, size: 26),
                const SizedBox(width: 5),
                Text('New Payment', style: primaryTextStyle(size: 14, color: backgroundColor)),
              ],
            ),
          ).visible(isNewPaymentHide).paddingOnly(bottom: 16),

        ],
      ),
    );
  }
}
