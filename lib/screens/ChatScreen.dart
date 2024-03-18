import 'package:gpay/model/Model.dart';
import 'package:gpay/utils/Colors.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../components/chat/MessageComponent.dart';

class GPChatScreen extends StatefulWidget {
  static String tag = '/GPChatScreen';

  final GPChatModel? userData;
  final GPContactModel? chatData;
  final String? screenName;

  const GPChatScreen({super.key, this.userData, this.chatData, this.screenName});

  @override
  GPChatScreenState createState() => GPChatScreenState();
}

class GPChatScreenState extends State<GPChatScreen> {
  late String contactUser;
  late String contactPhone;
  late String contactImg;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    if (widget.screenName == "ContactList") {
      contactUser = widget.chatData!.userName;
      contactPhone = widget.chatData!.userPhoneNumber;
      contactImg = widget.chatData!.userImg;
    }
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: backgroundColor,
        title: Row(
          children: [
            Stack(
              fit: StackFit.passthrough,
              alignment: Alignment.bottomRight,
              children: <Widget>[
                widget.screenName == "ContactList" ? CircleAvatar(backgroundImage: AssetImage(contactImg), radius: 22) : CircleAvatar(backgroundImage: AssetImage(widget.userData!.img), radius: 22),
              ],
            ),
            16.width,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                widget.screenName == "ContactList" ? Text(contactUser, style: primaryTextStyle(size: 14, weight: FontWeight.bold)) : Text(widget.userData!.name, style: primaryTextStyle(size: 14, weight: FontWeight.bold)),
                widget.screenName == "ContactList" ? Text(contactPhone, style: primaryTextStyle(size: 12)) : Text(widget.userData!.phoneNumber, style: primaryTextStyle(size: 12)),
              ],
            )
          ],
        ),
        actions: [
          PopupMenuButton(
            icon: const Icon(Icons.more_vert_outlined, color: GPColorBlack),
            onSelected: (dynamic v) {
              toast('Click');
              hideKeyboard(context);
            },
            itemBuilder: (BuildContext context) {
              List<PopupMenuEntry<Object>> list = [];

              list.add(const PopupMenuItem(value: 1, child: Text("Block", style: TextStyle(color: GPColorBlack))));
              list.add(const PopupMenuItem(value: 1, child: Text("Disable chat", style: TextStyle(color: GPColorBlack))));
              list.add(const PopupMenuItem(value: 1, child: Text("Report spam", style: TextStyle(color: GPColorBlack))));
              list.add(const PopupMenuItem(value: 1, child: Text("Refresh", style: TextStyle(color: GPColorBlack))));
              list.add(const PopupMenuItem(value: 1, child: Text("Send feedback", style: TextStyle(color: GPColorBlack))));

              return list;
            },
          )
        ],
      ),
      body: const GPMessageComponent(),
    );
  }
}
