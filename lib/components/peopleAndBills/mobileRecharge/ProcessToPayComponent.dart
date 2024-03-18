import 'package:gpay/components/commanWidget/AppRaisedButtonWidget.dart';
import 'package:gpay/utils/Colors.dart';
import 'package:gpay/utils/Images.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class GpProcessToPayComponent extends StatefulWidget {
  static String tag = '/ProcessToPayComponent';
  String? rechargeAmount;

  GpProcessToPayComponent({super.key, this.rechargeAmount});

  @override
  GpProcessToPayComponentState createState() => GpProcessToPayComponentState();
}

class GpProcessToPayComponentState extends State<GpProcessToPayComponent> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    await 100.milliseconds.delay;
    setStatusBarColor(GPAppColor, statusBarBrightness: Brightness.light, statusBarIconBrightness: Brightness.light);
  }

  @override
  void dispose() {
    super.dispose();
    setStatusBarColor(Colors.black);
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GPAppColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: GPAppColor,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(
            Icons.close,
            color: backgroundColor,
          ),
          onPressed: () {
            finish(context);
          },
        ),
        actions: [
          PopupMenuButton(
            icon: const Icon(
              Icons.more_vert_outlined,
              color: backgroundColor,
            ),
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
      body: Column(
        children: [
          SizedBox(
            height: context.height() * 0.58,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 22,
                      backgroundColor: backgroundColor,
                      child: CircleAvatar(radius: 20, backgroundImage: AssetImage(GPAY_user)),
                    ),
                    5.width,
                    const Icon(Icons.arrow_forward, color: backgroundColor),
                    5.width,
                    const CircleAvatar(
                      radius: 22,
                      backgroundColor: backgroundColor,
                      child: CircleAvatar(radius: 20, backgroundImage: AssetImage(GP_img1)),
                    ),
                  ],
                ),
                5.height,
                Text("Paying Vi Prepaid", style: primaryTextStyle(color: backgroundColor, size: 14)),
                15.height,
                Text('\u{20B9} ${widget.rechargeAmount}', style: primaryTextStyle(color: backgroundColor, size: 30, weight: FontWeight.bold)),
                5.height,
                Container(
                  margin: const EdgeInsets.only(left: 35, right: 35),
                  height: 50,
                  decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(25)), color: Colors.blue[900]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text("Mobile number:", style: primaryTextStyle(size: 14, color: backgroundColor)), 5.width, Text("+91 9876543210", style: primaryTextStyle(size: 14, color: backgroundColor))],
                  ),
                )
              ],
            ).center(),
          ),
          Container(
            width: context.width(),
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(12.0), topRight: Radius.circular(12.0)),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 2, bottom: 2, left: 8, right: 8),
                      decoration: BoxDecoration(border: Border.all(color: Colors.grey[300]!), borderRadius: BorderRadius.circular(5)),
                      child: Image.asset(GP_bank_of_baroda, height: 26, width: 26),
                    ),
                    12.width,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("GPay Bank 1111", style: primaryTextStyle(size: 14, color: GPColorBlack, weight: FontWeight.bold)),
                        3.height,
                        Text("Savings account", style: secondaryTextStyle(size: 14)),
                        Text("BobsJohn.gpay@com", style: secondaryTextStyle(size: 14)),
                      ],
                    ).expand(),
                  ],
                ),
                30.height,
                AppRaisedButton(
                  width: context.width(),
                  height: 50,
                  title: 'Process to pay',
                  titleSize: 14,
                  onPressed: () {
                    toast('proceed to pay');
                  },
                  borderRadius: 25,
                ),
                15.height,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Powered by".toUpperCase(), style: secondaryTextStyle(size: 8, color: Colors.grey)),
                    10.width,
                    Text("GPay", style: secondaryTextStyle(size: 12, color: Colors.black)),
                  ],
                ),
                20.height,
                Text('User other UPI app', style: secondaryTextStyle(decoration: TextDecoration.underline, size: 12))
              ],
            ),
          ).expand(),
        ],
      ),
    );
  }
}
