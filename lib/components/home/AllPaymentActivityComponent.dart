import 'package:gpay/model/Model.dart';
import 'package:gpay/utils/Colors.dart';
import 'package:gpay/utils/DataProvider.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class GPAllPaymentActivityComponent extends StatefulWidget {
  static String tag = '/GPAllPaymentActivityComponent';

  const GPAllPaymentActivityComponent({super.key});

  @override
  GPAllPaymentActivityComponentState createState() => GPAllPaymentActivityComponentState();
}

class GPAllPaymentActivityComponentState extends State<GPAllPaymentActivityComponent> {
  List<GPAllTransactionsModel> allTransactionList = getAllTransactionsData();

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
        elevation: 1,
        backgroundColor: backgroundColor,
        centerTitle: false,
        title: Text("All transactions", style: primaryTextStyle(size: 16, color: GPColorBlack, weight: FontWeight.bold)),
        actions: [
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
      body: transactionsList(),
    );
  }

  Widget transactionsList() {
    return ListView.separated(
      padding: const EdgeInsets.only(top: 6),
      separatorBuilder: (context, index) {
        return Divider(
          color: Colors.grey[400],
        );
      },
      scrollDirection: Axis.vertical,
      itemCount: allTransactionList.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        GPAllTransactionsModel mData = allTransactionList[index];
        return Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.grey,
              child: CircleAvatar(radius: 20, backgroundImage: AssetImage(mData.img)),
            ),
            10.width,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text(mData.name, style: primaryTextStyle(size: 16, color: GPColorBlack)), 10.width, Text(mData.date, style: secondaryTextStyle(size: 12))],
            ).expand(),
            Text(mData.amount, style: primaryTextStyle(color: (index % 2 == 0) ? Colors.red : Colors.green, weight: FontWeight.bold, size: 14))
          ],
        ).paddingOnly(left: 16, right: 16, top: 10, bottom: 10);
      },
    );
  }
}
