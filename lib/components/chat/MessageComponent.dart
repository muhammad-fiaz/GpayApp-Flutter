import 'package:gpay/components/chat/ChatMessageWidget.dart';
import 'package:gpay/components/chat/PayComponent.dart';
import 'package:gpay/model/Model.dart';
import 'package:gpay/utils/Colors.dart';
import 'package:gpay/utils/DataProvider.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class GPMessageComponent extends StatefulWidget {
  static String tag = '/MessageComponent';

  final String? personName;

  @override
  GPMessageComponentState createState() => GPMessageComponentState();

  const GPMessageComponent({super.key, this.personName});
}

class GPMessageComponentState extends State<GPMessageComponent> {
  ScrollController scrollController = ScrollController();
  TextEditingController msgController = TextEditingController();
  FocusNode msgFocusNode = FocusNode();
  var msgListing = getChatMsgData();
  var personName = '';
  bool isTabSelected = true;
  String? msg;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {}

  sendMessage() async {
    if (msgController.text.trim().isNotEmpty) {
      var msgModel = GPMessageModel();
      msgModel.msg = msgController.text.toString();
      msgModel.senderId = sender_id;
      hideKeyboard(context);
      msgListing.insert(0, msgModel);

      var msgModel1 = GPMessageModel();
      msgModel1.msg = msgController.text.toString();
      msgModel1.senderId = receiver_id;

      msgController.text = '';

      if (mounted) scrollController.animToTop();
      FocusScope.of(context).requestFocus(msgFocusNode);
      setState(() {});

      await Future.delayed(const Duration(seconds: 1));

      msgListing.insert(0, msgModel1);

      if (mounted) scrollController.animToTop();
    } else {
      FocusScope.of(context).requestFocus(msgFocusNode);
    }

    setState(() {});
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    Widget msgList() {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 4),
        decoration: const BoxDecoration(color: Colors.white),
        child: ListView.separated(
          separatorBuilder: (_, i) => const Divider(color: Colors.transparent),
          shrinkWrap: true,
          reverse: true,
          controller: scrollController,
          itemCount: msgListing.length,
          padding: const EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 70),
          itemBuilder: (_, index) {
            GPMessageModel data = msgListing[index];
            var isMe = data.senderId == sender_id;

            return GPChatMessageWidget(isMe: isMe, data: data);
          },
        ),
      );
    }

    Widget textField() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          padding: const EdgeInsets.only(top: 10, bottom: 10, right: 10),
          decoration: BoxDecoration(color: Colors.white, boxShadow: defaultBoxShadow()),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(left: 100),
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: const BoxDecoration(color: GPAppColor, borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Text("Pay", style: secondaryTextStyle(size: 12, color: backgroundColor, weight: FontWeight.bold)),
              ).visible(isTabSelected).onTap(() {
                const GPPayComponent().launch(context);
              }),
              8.width,
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: const BoxDecoration(color: GPAppColor, borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Text("Request", style: secondaryTextStyle(size: 12, color: backgroundColor, weight: FontWeight.bold)),
              ).visible(isTabSelected),
              CircleAvatar(
                backgroundColor: Colors.blue,
                radius: 16,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  icon: const Icon(Icons.navigate_next_outlined),
                  color: Colors.white,
                  onPressed: () {
                    setState(() {
                      isTabSelected = true;
                      hideKeyboard(context);
                    });
                  },
                ),
              ).onTap(() {}).visible(!isTabSelected),
              16.width,
              TextField(
                controller: msgController,
                focusNode: msgFocusNode,
                autofocus: false,
                textCapitalization: TextCapitalization.sentences,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                    filled: true,
                    suffixIcon: const Icon(Icons.navigate_next_outlined, color: GPColorBlack, size: 40).visible(!isTabSelected),
                    contentPadding: const EdgeInsets.only(left: 16, right: 16, top: 0, bottom: 0),
                    enabledBorder: OutlineInputBorder(borderRadius: const BorderRadius.all(Radius.circular(24)), borderSide: BorderSide(color: Colors.grey[300]!)),
                    focusedBorder: OutlineInputBorder(borderRadius: const BorderRadius.all(Radius.circular(24)), borderSide: BorderSide(color: Colors.grey[300]!)),
                    hintText: personName.isNotEmpty ? 'Write to ${widget.personName}' : 'Type message',
                    hintStyle: primaryTextStyle(size: 14, color: Colors.grey)),
                style: primaryTextStyle(),
                onSubmitted: (s) {
                  sendMessage();
                },
                onTap: () {
                  isTabSelected = false;
                  setState(() {});
                },
              ).expand(),
            ],
          ),
        ),
      );
    }

    return Stack(
      children: [
        msgList(),
        textField(),
      ],
    );
  }
}
