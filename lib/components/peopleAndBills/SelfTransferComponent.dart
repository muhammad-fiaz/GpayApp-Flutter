import 'package:gpay/utils/AppWidget.dart';
import 'package:gpay/utils/Colors.dart';
import 'package:gpay/utils/Images.dart';
import 'package:gpay/utils/fdottedline.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class GPSelfTransferComponent extends StatefulWidget {
  static String tag = '/GPSelfTransferComponent';

  const GPSelfTransferComponent({super.key});

  @override
  GPSelfTransferComponentState createState() => GPSelfTransferComponentState();
}

class GPSelfTransferComponentState extends State<GPSelfTransferComponent> {
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
        elevation: 2,
        automaticallyImplyLeading: true,
        title: Text("Self Transfer", style: primaryTextStyle(size: 14, color: GPColorBlack, weight: FontWeight.bold)),
        actions: [
          PopupMenuButton(
            icon: const Icon(
              Icons.more_vert_outlined,
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
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text("Manage your money better by adding another account to make self-transfers", style: primaryTextStyle(size: 13, color: GPColorBlack), textAlign: TextAlign.start),
            30.height,
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
                    Text("Bank of Baroda 6818", style: primaryTextStyle(size: 14, color: GPColorBlack, weight: FontWeight.bold)),
                    3.height,
                    Text("Savings account", style: secondaryTextStyle(size: 14)),
                    Text("johndoe@okaxis", style: secondaryTextStyle(size: 14)),
                  ],
                ).expand(),
              ],
            ),
            30.height,
            Row(
              children: [
                FDottedLine(
                  color: GPAppColor,
                  height: 40.0,
                  width: 80.0,
                  space: 3.0,
                  corner: FDottedLineCorner.all(5),
                  child: const SizedBox(
                    height: 30.0,
                    width: 50.0,
                    child: Icon(Icons.add, color: GPAppColor),
                  ),
                ),
                14.width,
                Text("ADD BANK ACCOUNT", style: primaryTextStyle(size: 12, color: GPAppColor, weight: FontWeight.bold))
              ],
            ),
            commonCacheImageWidget(GP_money_transfer).expand()
          ],
        ),
      ),
    );
  }
}
