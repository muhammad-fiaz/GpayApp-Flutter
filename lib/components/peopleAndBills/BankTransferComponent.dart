import 'package:gpay/components/commanWidget/AppRaisedButtonWidget.dart';
import 'package:gpay/utils/Colors.dart';
import 'package:gpay/utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class GPBankTransferComponent extends StatefulWidget {
  static String tag = '/GPBankTransferComponent';

  const GPBankTransferComponent({super.key});

  @override
  GPBankTransferComponentState createState() => GPBankTransferComponentState();
}

class GPBankTransferComponentState extends State<GPBankTransferComponent> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController accountNumberController = TextEditingController();
  TextEditingController reenterAccountController = TextEditingController();
  TextEditingController iFSCController = TextEditingController();
  TextEditingController recipientController = TextEditingController();

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
        title: Text("Enter Bank Details", style: primaryTextStyle(size: 14)),
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
                const PopupMenuItem(value: 1, child: Text("Send feedback", style: TextStyle(color: GPColorBlack))),
              );
              return list;
            },
          )
        ],
      ),
      bottomNavigationBar: Container(
        height: 150,
        padding: const EdgeInsets.only(left: 28, right: 28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "This information will be securely saved as per the $GPAYAppName Terms of Services and Privacy Policy.",
              style: secondaryTextStyle(size: 14, color: GPColorBlack),
              textAlign: TextAlign.center,
            ).paddingOnly(left: 20, right: 20),
            20.height,
            AppRaisedButton(
              width: context.width(),
              height: 50,
              color: Colors.grey[300],
              title: 'Continue',
              titleColor: Colors.grey,
              titleSize: 14,
              onPressed: () {
                toast('continue');
              },
              borderRadius: 25,
            ),
          ],
        ),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 30, right: 20, left: 20, bottom: 16),
                child: Column(
                  children: [
                    TextFormField(
                      controller: accountNumberController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(0.0),
                        labelStyle: TextStyle(color: GPAppColor, fontSize: 14),
                        labelText: "Account Number",
                        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: GPAppColor)),
                        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: GPColorBlack)),
                      ),
                      maxLines: 1,
                    ),
                    35.height,
                    TextFormField(
                      controller: reenterAccountController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(0.0),
                        labelStyle: TextStyle(color: GPAppColor, fontSize: 14),
                        labelText: "Re-enter account number",
                        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: GPAppColor)),
                        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: GPColorBlack)),
                      ),
                      maxLines: 1,
                    ),
                    35.height,
                    Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "Search for IFSC",
                          style: primaryTextStyle(color: GPAppColor, size: 14),
                        )),
                    TextFormField(
                      controller: iFSCController,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(0.0),
                        labelStyle: TextStyle(color: GPAppColor, fontSize: 14),
                        labelText: "IFSC",
                        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: GPAppColor)),
                        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: GPColorBlack)),
                      ),
                      maxLines: 1,
                    ),
                    35.height,
                    TextFormField(
                      controller: iFSCController,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(0.0),
                        labelStyle: TextStyle(color: GPAppColor, fontSize: 14),
                        labelText: "Recipient name",
                        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: GPAppColor)),
                        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: GPColorBlack)),
                      ),
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
