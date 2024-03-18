import 'package:gpay/model/Model.dart';
import 'package:gpay/utils/Colors.dart';
import 'package:gpay/utils/DataProvider.dart';
import 'package:gpay/utils/Images.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class GPRechargeLinkNumberComponent extends StatefulWidget {
  static String tag = '/GPRechargeLinkNumberComponent';
  String? image;
  String? name;

  GPRechargeLinkNumberComponent({super.key, this.image, this.name});

  @override
  GPRechargeLinkNumberComponentState createState() => GPRechargeLinkNumberComponentState();
}

class GPRechargeLinkNumberComponentState extends State<GPRechargeLinkNumberComponent> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  FocusNode countryCodeFocusNode = FocusNode();

  List<GPContactModel> getContactList = getContactData();
  List<GPContactModel> getNewContactList = [];
  bool isShowList = false;
  bool isFloatingVisible = false;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    countryController.text = '+91';
    FocusScope.of(context).requestFocus(countryCodeFocusNode);
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
            CircleAvatar(
              radius: 16,
              backgroundColor: Colors.grey,
              child: CircleAvatar(radius: 16, backgroundImage: AssetImage(widget.image!)),
            ),
            8.width,
            Text(widget.name!, style: primaryTextStyle(size: 14, color: GPColorBlack, weight: FontWeight.bold)),
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
                  child: Text("Send feedback", style: TextStyle(color: GPColorBlack)),
                ),
              );
              return list;
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0.0, //Edit Here
        backgroundColor: !isFloatingVisible ? Colors.grey[200] : GPAppColor,
        child: !isFloatingVisible ? Icon(Icons.navigate_next_rounded, color: Colors.grey[600]) : const Icon(Icons.navigate_next_rounded, color: backgroundColor),
        onPressed: () {},
      ).visible(getNewContactList.isNotEmpty),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(20),
        children: [
          Text('enter mobile number'.toUpperCase(), style: primaryTextStyle(color: GPColorBlack, weight: FontWeight.bold, size: 14)),
          20.height,
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 35,
                    child: TextFormField(
                      controller: countryController,
                      style: const TextStyle(fontSize: 18, color: GPColorBlack),
                      cursorColor: GPAppColor,
                      readOnly: true,
                      enabled: false,
                      decoration: const InputDecoration(focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: GPAppColor))),
                      keyboardType: TextInputType.text,
                    ),
                  )
                ],
              ),
              10.width,
              TextFormField(
                focusNode: countryCodeFocusNode,
                controller: phoneController,
                autofocus: true,
                maxLength: 10,
                style: primaryTextStyle(size: 20, color: GPColorBlack),
                cursorColor: GPAppColor,
                decoration: const InputDecoration(focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: GPAppColor)), counter: SizedBox(height: 0.0)),
                keyboardType: TextInputType.number,
                onChanged: (text) {
                  setState(() {
                    if (text.isNotEmpty) {
                      getNewContactList = getContactList.where((list) => (list.userPhoneNumber.contains(text))).toList();
                      if (text.length > 8) {
                        setState(() {
                          isFloatingVisible = !isFloatingVisible;
                        });
                      }
                    } else {
                      isShowList = false;
                      getNewContactList.clear();
                    }
                  });
                },
              ).expand(),
              10.width,
              Image.asset(GP_user_icon, color: GPColorBlack, height: 24, width: 24),
            ],
          ),
          20.height,
          ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: getNewContactList.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              GPContactModel mData = getNewContactList[index];
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
              ).paddingOnly(top: 10, bottom: 10);
            },
          ).visible(getNewContactList.isNotEmpty),
        ],
      ),
    );
  }
}
