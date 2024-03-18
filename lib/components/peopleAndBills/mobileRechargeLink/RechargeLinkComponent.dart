import 'package:gpay/components/commanWidget/AppRaisedButtonWidget.dart';
import 'package:gpay/components/peopleAndBills/mobileRechargeLink/RechargeLinkNumberComponent.dart';
import 'package:gpay/model/Model.dart';
import 'package:gpay/utils/Colors.dart';
import 'package:gpay/utils/fdottedline.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class GPRechargeLinkComponent extends StatefulWidget {
  static String tag = '/GPRechargeLinkComponent';
  GPRechargeModel? data;

  GPRechargeLinkComponent({super.key, this.data});

  @override
  GPRechargeLinkComponentState createState() => GPRechargeLinkComponentState();
}

class GPRechargeLinkComponentState extends State<GPRechargeLinkComponent> {
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        titleSpacing: 0,
        elevation: 1,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            IconButton(
                icon: Icon(isEnable ? Icons.close : Icons.arrow_back_outlined),
                onPressed: () {
                  setState(() {
                    isEnable = false;
                  });
                }),
            CircleAvatar(
              radius: 16,
              backgroundColor: Colors.grey,
              child: CircleAvatar(radius: 16, backgroundImage: AssetImage(widget.data!.img)),
            ),
            8.width,
            Text(widget.data!.name, style: primaryTextStyle(size: 14, color: GPColorBlack, weight: FontWeight.bold)),
          ],
        ),
        actions: [
          PopupMenuButton(
            icon: const Icon(
              Icons.more_vert_outlined,
              color: GPColorBlack,
            ),
            onSelected: (dynamic v) {
              toast('Click');
            },
            itemBuilder: (BuildContext context) {
              List<PopupMenuEntry<Object>> list = [];
              list.add(
                const PopupMenuItem(
                  value: 1,
                  child: Text("Refresh", style: TextStyle(color: GPColorBlack)),
                ),
              );
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
        color: backgroundColor,
        child: Column(
          children: [
            isEnable
                ? Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 20, bottom: 20, right: 12, left: 12),
                        child: Row(
                          children: [
                            FDottedLine(
                              color: GPAppColor,
                              height: 60.0,
                              width: 60.0,
                              space: 3.0,
                              corner: FDottedLineCorner.all(30),
                              child: const SizedBox(height: 35.0, width: 35.0, child: Icon(Icons.add, color: GPAppColor)),
                            ),
                            10.width,
                            Text("Link account", style: primaryTextStyle(size: 14, color: GPColorBlack)),
                          ],
                        ),
                      ).onTap(() {
                        GPRechargeLinkNumberComponent(image: widget.data!.img, name: widget.data!.name).launch(context);
                      }),
                      Flexible(
                        child: Container(
                          width: context.width(),
                          height: context.height(),
                          color: Colors.grey,
                        ).onTap(() {
                          setState(() {
                            isEnable = !isEnable;
                          });
                        }),
                      )
                    ],
                  ).expand()
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: const BoxDecoration(boxShadow: <BoxShadow>[BoxShadow(color: Colors.grey, blurRadius: 10.0, offset: Offset(0.0, 0.75))], color: backgroundColor),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("No mobile number linked", style: secondaryTextStyle(size: 12, weight: FontWeight.bold)),
                            const Icon(Icons.keyboard_arrow_down, color: GPColorBlack),
                          ],
                        ),
                      ).onTap(() {
                        setState(() {
                          isEnable = !isEnable;
                        });
                      }),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Link your 'Prepaid' number to view plans\nand recharge now.", style: primaryTextStyle(size: 14), textAlign: TextAlign.center),
                            16.height,
                            AppRaisedButton(
                              title: 'Link mobile number',
                              titleSize: 14,
                              onPressed: () {
                                GPRechargeLinkNumberComponent(image: widget.data!.img, name: widget.data!.name).launch(context);
                              },
                              borderRadius: 25,
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                    ],
                  ).expand(),
          ],
        ),
      ),
    );
  }
}
