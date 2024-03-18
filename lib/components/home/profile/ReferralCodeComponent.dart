import 'package:gpay/components/commanWidget/AppRaisedButtonWidget.dart';
import 'package:gpay/utils/Colors.dart';
import 'package:gpay/utils/Images.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class GPReferralCodeComponent extends StatefulWidget {
  static String tag = '/ReferralCodeComponent';

  const GPReferralCodeComponent({super.key});

  @override
  GPReferralCodeComponentState createState() => GPReferralCodeComponentState();
}

class GPReferralCodeComponentState extends State<GPReferralCodeComponent> {
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
        backgroundColor: backgroundColor,
        elevation: 0,
        automaticallyImplyLeading: true,
        title: Text("Referral code", style: primaryTextStyle(size: 16, color: GPColorBlack, weight: FontWeight.bold)),
        actions: [
          PopupMenuButton(
            icon: const Icon(Icons.more_vert_outlined, color: GPColorBlack),
            onSelected: (dynamic v) {
              toast('Click');
            },
            itemBuilder: (BuildContext context) {
              List<PopupMenuEntry<Object>> list = [];
              list.add(
                const PopupMenuItem(value: 1, child: Text("Send Feedback", style: TextStyle(color: GPColorBlack))),
              );
              return list;
            },
          )
        ],
      ),
      bottomNavigationBar: AppRaisedButton(
        title: 'Invite friends',
        height: 50,
        titleSize: 14,
        onPressed: () {},
        borderRadius: 25,
      ).paddingOnly(left: 20, right: 20, bottom: 20),
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(GP_referral_code_bg, height: 160, fit: BoxFit.fill, width: context.width()),
            30.height,
            Row(
              children: [
                Image.asset(GP_checkmark_green, height: 28, width: 28),
                10.width,
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(text: 'Referral reward earned', style: primaryTextStyle(size: 13, color: Colors.green[500])),
                      TextSpan(text: '  (87mt6s)!', style: primaryTextStyle(size: 13, weight: FontWeight.bold, color: Colors.green[500]))
                    ],
                  ),
                ),
              ],
            ),
            30.height,
            Text("You can earn more rewards by referring your friends to Pay. Semd then your refferal code", style: primaryTextStyle(size: 14, color: GPColorBlack)),
            Text("(32y52b).", style: primaryTextStyle(size: 14, color: GPColorBlack, weight: FontWeight.bold), textAlign: TextAlign.start),
          ],
        ),
      ),
    );
  }
}
