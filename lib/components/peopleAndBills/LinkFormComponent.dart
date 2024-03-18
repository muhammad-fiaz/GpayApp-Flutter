import 'package:gpay/model/Model.dart';
import 'package:gpay/utils/Colors.dart';
import 'package:gpay/utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class DthLinkFormComponent extends StatefulWidget {
  static String tag = '/DthLinkFormComponent';
  GPDthDetailsModel? data;

  DthLinkFormComponent({super.key, this.data});

  @override
  DthLinkFormComponentState createState() => DthLinkFormComponentState();
}

class DthLinkFormComponentState extends State<DthLinkFormComponent> {
  var linkData;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    linkData = widget.data;
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
                icon: const Icon(Icons.close),
                onPressed: () {
                  finish(context);
                }),
            CircleAvatar(
              radius: 16,
              backgroundColor: Colors.grey,
              child: CircleAvatar(radius: 16, backgroundImage: AssetImage(linkData.img)),
            ),
            8.width,
            Text(linkData.name, style: primaryTextStyle(size: 14, color: GPColorBlack, weight: FontWeight.bold)),
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
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Link account", style: primaryTextStyle(size: 14, color: GPColorBlack)),
                16.height,
                TextFormField(
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(0.0),
                    labelStyle: TextStyle(color: GPAppColor, fontSize: 14),
                    labelText: "Account Number / Mobile Number / MAC ID",
                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: GPAppColor)),
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: GPColorBlack)),
                  ),
                  maxLines: 1,
                ),
                5.height,
                Text("please enter a vaild account number/mobile number/MAC ID", style: secondaryTextStyle(size: 12)),
                24.height,
                TextFormField(
                  decoration: const InputDecoration(
                    labelStyle: TextStyle(color: GPAppColor, fontSize: 14),
                    labelText: "Account Name",
                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: GPAppColor)),
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: GPColorBlack)),
                  ),
                  maxLines: 1,
                ),
                5.height,
                Text("Eg: Home (Optional)", style: secondaryTextStyle(size: 12)),
                40.height,
                Text("Digital TV may send you promotional offers and account related communication through $GPAYAppName.$GPAYAppName app Terms of Service are applicable to your usage of bill payment service.",
                    style: secondaryTextStyle(size: 11, weight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0.0, //Edit Here
        backgroundColor: Colors.grey[200],
        child: Icon(Icons.navigate_next_rounded, color: Colors.grey[600]),
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            print("button click here");
          }
        },
      ),
    );
  }
}
