import 'package:gpay/components/home/profile/setting/SettingsComponent.dart';
import 'package:gpay/utils/AppWidget.dart';
import 'package:gpay/utils/Colors.dart';
import 'package:gpay/utils/Images.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:share/share.dart';

import 'ProfileDetailsScreenComponent.dart';
import 'ReferralCodeComponent.dart';

class GPProfileComponent extends StatefulWidget {
  static String tag = '/GPProfileComponent';

  const GPProfileComponent({super.key});

  @override
  GPProfileComponentState createState() => GPProfileComponentState();
}

class GPProfileComponentState extends State<GPProfileComponent> {
  String referralCode = "32Y52B";
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_outlined, color: GPColorBlack),
          onPressed: () {
            finish(context);
          },
        ),
        backgroundColor: const Color(0xFFe8ebfd),
        actions: [
          PopupMenuButton(
            icon: const Icon(Icons.more_vert_outlined, color: GPColorBlack),
            onSelected: (dynamic v) {
              const GPReferralCodeComponent().launch(context);
            },
            itemBuilder: (BuildContext context) {
              List<PopupMenuEntry<Object>> list = [];

              list.add(
                const PopupMenuItem(value: 1, child: Text("Referral code", style: TextStyle(color: GPColorBlack))),
              );
              return list;
            },
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            decoration: const BoxDecoration(image: DecorationImage(image: AssetImage(GP_profile_bg), fit: BoxFit.cover)),
            height: 160,
            width: context.width(),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Andrew Lincon", style: primaryTextStyle(size: 18, color: GPColorBlack, weight: FontWeight.bold)),
                    5.height,
                    Text("+91 389855849", style: primaryTextStyle(size: 14, color: GPColorBlack)),
                    5.height,
                    Text("BobJohn.gpay@com", style: primaryTextStyle(size: 14, color: GPColorBlack)),
                    30.height,
                    Row(
                      children: [
                        Image.asset(GP_trophy, height: 26, width: 26),
                        10.width,
                        Text("\u20B9 128", style: primaryTextStyle(size: 16, color: GPColorBlack, weight: FontWeight.bold)),
                        10.width,
                        Text("Reward earned", style: primaryTextStyle(size: 14, color: GPColorBlack))
                      ],
                    )
                  ],
                ).expand(),
                Hero(
                  tag: 'profile',
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: const AssetImage(GP_dotted_profile_img),
                    child: Stack(
                      children: [
                        const CircleAvatar(radius: 40, backgroundImage: AssetImage(GPAY_user)),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            width: 26,
                            height: 26,
                            padding: const EdgeInsets.all(5),
                            decoration: const BoxDecoration(shape: BoxShape.circle, color: GPAppColor),
                            child: Image.asset(GP_four_arrow_direction, color: backgroundColor, height: 24, width: 24),
                          ),
                        )
                      ],
                    ),
                  ),
                ).onTap(() {
                  const GPProfileDetailsScreenComponent().launch(context);
                }),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            color: backgroundColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                10.height,
                Align(
                  alignment: Alignment.topLeft,
                  child: Text("bank account and cards".toUpperCase(), style: primaryTextStyle(size: 11, color: GPColorBlack, weight: FontWeight.bold)),
                ),
                20.height,
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 5, bottom: 5, left: 15, right: 15),
                      decoration: boxDecorationWithRoundedCorners(borderRadius: radius(5), border: Border.all(color: Colors.grey[300]!)),
                      child: commonCacheImageWidget(GP_bank_of_baroda, height: 26, width: 26),
                    ),
                    16.width,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("GPay Bank **** 1111", style: primaryTextStyle(size: 14, color: Colors.black87, weight: FontWeight.bold)),
                        5.height,
                        Row(
                          children: [
                            commonCacheImageWidget(GP_checkmark_green, height: 15, width: 15),
                            5.width,
                            Text("Default bank account", style: primaryTextStyle(size: 13, color: GPColorBlack)),
                          ],
                        ),
                      ],
                    ).expand(),
                    const Icon(Icons.navigate_next_outlined, size: 24),
                  ],
                ),
                16.height,
                Divider(color: Colors.grey[300], thickness: 1),
                16.height,
                Row(
                  children: [
                    const Icon(Icons.card_giftcard, color: GPAppColor, size: 26),
                    16.width,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Invite and earn", style: primaryTextStyle(size: 14, color: Colors.black87, weight: FontWeight.bold)),
                        3.height,
                        Row(
                          children: [
                            Text("Share this code", style: primaryTextStyle(size: 13)),
                            5.width,
                            Text(referralCode, style: primaryTextStyle(size: 13, color: GPAppColor, weight: FontWeight.bold)),
                            5.width,
                            const Icon(Icons.copy, color: GPAppColor, size: 15)
                          ],
                        )
                      ],
                    ).onTap(() {
                      referralCode.copyToClipboard();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('$referralCode Copied to Clipboard')),
                      );
                    }).expand(),
                    ElevatedButton(
                      onPressed: () async {
                        await Share.share('Invite Reward');
                      },
                      style: ButtonStyle(
                        side: MaterialStateProperty.resolveWith((states) {
                          return const BorderSide(color: lightGrey, width: 1);
                        }),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                      ),
                      child: Text("Invite", style: primaryTextStyle(color: GPColorBlack, size: 14)),
                    ),

                  ],
                ),
                30.height,
                Row(
                  children: [
                    const Icon(Icons.settings, color: GPAppColor, size: 26),
                    16.width,
                    Text("Settings", style: primaryTextStyle(size: 14, color: Colors.black87, weight: FontWeight.bold)).expand(),
                    const Icon(Icons.navigate_next_outlined, size: 24),
                  ],
                ).onTap(() async {
                  await const GPSettingsComponent().launch(context);

                  await 200.milliseconds.delay;
                  setStatusBarColor(black, statusBarIconBrightness: Brightness.dark, statusBarBrightness: Brightness.dark);
                }),
                30.height,
                Row(
                  children: [
                    const Icon(Icons.help_outline, color: GPAppColor, size: 26),
                    16.width,
                    Text("Help and feedback", style: primaryTextStyle(size: 14, color: Colors.black87, weight: FontWeight.bold)).expand(),
                    const Icon(Icons.navigate_next_outlined, size: 24),
                  ],
                ),
              ],
            ),
          ).expand(),
          Container(
            height: 50,
            width: context.width(),
            decoration: boxDecorationWithRoundedCorners(
              backgroundColor: backgroundColor,
              borderRadius: radiusOnly(topRight: 24, topLeft: 24),
              border: Border.all(color: backgroundColor),
              boxShadow: [
                const BoxShadow(color: Colors.grey, blurRadius: 2.0, offset: Offset(0.0, 0.10)),
              ],
            ),
            child: Icon(Icons.keyboard_arrow_up, size: 40, color: Colors.grey[300]),
          ).onTap(() {
            finish(context);
          }),
        ],
      ),
    );
  }
}
