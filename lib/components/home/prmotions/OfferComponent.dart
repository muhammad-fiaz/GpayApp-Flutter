import 'package:carousel_slider/carousel_slider.dart';
import 'package:gpay/components/home/prmotions/GPOfferDetailsComponent.dart';
import 'package:gpay/model/Model.dart';
import 'package:gpay/utils/Colors.dart';
import 'package:gpay/utils/Constants.dart';
import 'package:gpay/utils/DataProvider.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:share/share.dart';

class GPOfferComponent extends StatefulWidget {
  static String tag = '/GPOfferComponent';

  const GPOfferComponent({super.key});

  @override
  GPOfferComponentState createState() => GPOfferComponentState();
}

class GPOfferComponentState extends State<GPOfferComponent> {
  List<GPOfferModel> offerList = getOfferData();
  String? image;
  String? amount;
  String? description;
  int currentpage = 0;

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
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          elevation: 0,
          backgroundColor: backgroundColor,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text("Discover offers", style: primaryTextStyle(color: GPColorBlack, size: 16, weight: FontWeight.bold))],
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.share, color: GPColorBlack),
              onPressed: () async {
                await Share.share('share Link');
              },
            ),
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
                    child: Text("Send Feedback", style: TextStyle(color: GPColorBlack)),
                  ),
                );
                return list;
              },
            )
          ],
        ),
        bottomNavigationBar: Wrap(
          alignment: WrapAlignment.center,
          children: [
            Container(
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                    decoration: BoxDecoration(border: Border.all(color: GPAppColor), borderRadius: const BorderRadius.all(Radius.circular(20))),
                    child: Text("See offer details", style: primaryTextStyle(color: GPAppColor, size: 14)))
                .onTap(() {
              GPOfferDetailsComponent(image: offerList[currentpage].img, amount: offerList[currentpage].earnAmount, description: offerList[currentpage].description).launch(context);
            })
          ],
        ).paddingOnly(top: 16, bottom: 16),
        body: CarouselSlider.builder(
            itemCount: offerList.length,
            options: CarouselOptions(
              height: MediaQuery.of(context).size.height,
              autoPlay: false,
              initialPage: 0,
              enableInfiniteScroll: false,
              enlargeCenterPage: false,
              viewportFraction: 0.75,
              aspectRatio: 2.0,
              onPageChanged: (i, _) {
                currentpage = i;
                setState(() {});
              },
            ),
            itemBuilder: (BuildContext context, int itemIndex, i) {
              GPOfferModel mdata = offerList[itemIndex];
              return Container(
                padding: const EdgeInsets.only(left: 12, right: 12),
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(mdata.img, height: 250, width: 350),
                    ),
                    20.height,
                    Text(mdata.earnAmount, style: primaryTextStyle(size: 22, color: GPColorBlack), textAlign: TextAlign.center),
                    5.height,
                    Text(mdata.description, style: primaryTextStyle(size: 15, color: GPColorBlack), textAlign: TextAlign.center),
                    const Spacer(),
                    Text("From $GPAYAppName".toUpperCase(), style: secondaryTextStyle(size: 10, color: GPColorBlack)),
                    5.height,
                    Text("Offer expires 31 December 2020".toUpperCase(), style: secondaryTextStyle(size: 10, color: GPColorBlack))
                  ],
                ).paddingTop(12),
              ).onTap(() {
                GPOfferDetailsComponent(image: offerList[itemIndex].img, amount: offerList[itemIndex].earnAmount, description: offerList[itemIndex].description).launch(context);
              });
            }));
  }
}
