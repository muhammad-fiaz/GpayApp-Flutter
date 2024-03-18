import 'package:gpay/components/peopleAndBills/mobileRecharge/RechargeTabComponent.dart';
import 'package:gpay/model/Model.dart';
import 'package:gpay/utils/Colors.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class GPMobileRechargeComponent extends StatefulWidget {
  static String tag = '/GPMobileRechargeComponent';
  GPRechargeModel? data;

  GPMobileRechargeComponent({super.key, this.data});

  @override
  GPMobileRechargeComponentState createState() => GPMobileRechargeComponentState();
}

class GPMobileRechargeComponentState extends State<GPMobileRechargeComponent> {
  var searchController = TextEditingController();
  var searchFocus = FocusNode();

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
        automaticallyImplyLeading: true,
        title: Row(
          children: [
            widget.data != null
                ? CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.grey,
                    child: CircleAvatar(radius: 16, backgroundImage: AssetImage(widget.data!.img)),
                  )
                : Container(),
            8.width,
            widget.data != null ? Text(widget.data!.name, style: primaryTextStyle(size: 14, color: GPColorBlack, weight: FontWeight.bold)) : Container(),
          ],
        ),
        actions: [
          PopupMenuButton(
            icon: const Icon(Icons.more_vert_outlined, color: GPColorBlack),
            onSelected: (dynamic v) {
              toast('Click');
            },
            itemBuilder: (BuildContext context) {
              List<PopupMenuEntry<Object>> list = [];
              list.add(const PopupMenuItem(value: 1, child: Text("Refresh", style: TextStyle(color: GPColorBlack))));
              list.add(const PopupMenuItem(value: 1, child: Text("Send feedback", style: TextStyle(color: GPColorBlack))));
              return list;
            },
          )
        ],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: const BoxDecoration(boxShadow: <BoxShadow>[
                  BoxShadow(color: Colors.grey, blurRadius: 10.0, offset: Offset(0.0, 0.75)),
                ], color: backgroundColor),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: GPAppColor,
                      radius: 20,
                      child: Text("L", style: primaryTextStyle(color: backgroundColor)),
                    ),
                    10.width,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Bob John", style: secondaryTextStyle(size: 12, weight: FontWeight.bold, color: GPColorBlack)),
                        5.height,
                        Text("+91 9876543210", style: secondaryTextStyle(size: 10, weight: FontWeight.bold, color: Colors.grey)),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 4),
                child: Text("Pick a plan below to get started.", style: secondaryTextStyle(size: 14)),
              )
            ],
          ),
          ListView(
            shrinkWrap: true,
            children: [
              Container(
                height: context.height(),
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 1.9),
                padding: const EdgeInsets.only(top: 70),
                decoration: BoxDecoration(border: Border(top: BorderSide(color: Colors.grey[200]!, width: 1.5)), color: backgroundColor),
                child: Column(
                  children: [
                    Container(margin: const EdgeInsets.only(top: 10), height: 2, width: 50, color: Colors.grey[300]),
                    10.height,
                    TextFormField(
                      controller: searchController,
                      focusNode: searchFocus,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[100],
                        contentPadding: const EdgeInsets.symmetric(vertical: 0),
                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(25.0), borderSide: BorderSide(color: Colors.grey[300]!)),
                        border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(25.0))),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(Radius.circular(25.0)),
                          borderSide: BorderSide(color: Colors.grey[300]!),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(Radius.circular(25.0)),
                          borderSide: BorderSide(color: Colors.grey[300]!),
                        ),
                        hintText: 'Search for plan or enter amount',
                        hintStyle: secondaryTextStyle(size: 14),
                        prefixIcon: const Icon(Icons.search, color: Colors.grey),
                      ),
                      onTap: () {
                        //   hideKeyboard(context);
                      },
                    ).paddingOnly(right: 12, left: 12),
                    const GPRechargeTapComponent().expand()
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
