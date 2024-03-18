import 'package:gpay/model/Model.dart';
import 'package:gpay/screens/ChatScreen.dart';
import 'package:gpay/utils/Colors.dart';
import 'package:gpay/utils/DataProvider.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class ContactComponent extends StatefulWidget {
  static String tag = '/ContactComponent';

  const ContactComponent({super.key});

  @override
  ContactComponentState createState() => ContactComponentState();
}

class ContactComponentState extends State<ContactComponent> {
  late List<GPContactModel> getContactList;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    getContactList = getContactData();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: getContactList.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        GPContactModel mData = getContactList[index];
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(radius: 22, backgroundColor: Colors.white, backgroundImage: AssetImage(mData.userImg)),
            20.width,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(mData.userName, style: secondaryTextStyle(size: 12, color: GPColorBlack, weight: FontWeight.bold)),
                3.height,
                Text(mData.userPhoneNumber, style: secondaryTextStyle(size: 11, color: Colors.black54)),
              ],
            )
          ],
        ).paddingOnly(top: 10, bottom: 10).onTap(() {
          GPChatScreen(chatData: mData, screenName: "ContactList").launch(context);
        });
      },
    );
  }
}
