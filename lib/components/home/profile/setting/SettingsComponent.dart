import 'dart:io';

import 'package:gpay/utils/AppWidget.dart';
import 'package:gpay/utils/Colors.dart';
import 'package:gpay/utils/Constants.dart';
import 'package:gpay/utils/Images.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:package_info/package_info.dart';

import 'PaymentMethodComponent.dart';

class GPSettingsComponent extends StatefulWidget {
  static String tag = '/GPSettingsComponent';

  const GPSettingsComponent({super.key});

  @override
  GPSettingsComponentState createState() => GPSettingsComponentState();
}

class GPSettingsComponentState extends State<GPSettingsComponent> with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  AnimationController? animationController;

  String referralCode = "BobJohn@gpay.com";

  File? profileImage;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    animationController = AnimationController(vsync: this, duration: const Duration(seconds: 1));
    animationController!.forward(from: 0);
    animationController!.reset(); // stops the animation if in progress
    animationController!.forward();

    await 100.milliseconds.delay;
    setStatusBarColor(GPAppColor, statusBarIconBrightness: Brightness.light);
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          key: _scaffoldKey,
          elevation: 0,
          backgroundColor: GPAppColor,
          leading: IconButton(
            icon: const Icon(Icons.close, color: backgroundColor),
            onPressed: () {
              finish(context);
            },
          ),
          actions: [
            PopupMenuButton(
              icon: const Icon(Icons.more_vert_outlined, color: backgroundColor),
              onSelected: (dynamic v) {},
              itemBuilder: (BuildContext context) {
                List<PopupMenuEntry<Object>> list = [];

                list.add(PopupMenuItem(value: 1, child: Text("Send feedback", style: primaryTextStyle(color: GPColorBlack))));
                return list;
              },
            )
          ],
          bottom: bottomAppbarWidget(),
        ),
        body: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        profileImage != null
                            ? ClipRRect(borderRadius: BorderRadius.circular(50), child: Image.file(profileImage!, width: 80, height: 80, fit: BoxFit.fill))
                            : CircleAvatar(radius: 40, backgroundImage: AssetImage(profileImage != null ? profileImage as String : GPAY_user)),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            width: 26,
                            height: 26,
                            decoration: const BoxDecoration(shape: BoxShape.circle, color: GPAppColor),
                            child: const Center(child: Icon(Icons.edit_outlined, color: backgroundColor, size: 18)),
                          ),
                        )
                      ],
                    ).onTap(() {
                      dialogWidget(context);
                    }),
                    16.width,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Bob John", style: primaryTextStyle(color: GPColorBlack)),
                        4.height,
                        Text("+91 99293320323", style: primaryTextStyle(size: 12, color: GPColorBlack)),
                        2.height,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("upi id:".toUpperCase(), style: primaryTextStyle(size: 13, color: GPColorBlack)),
                                4.width,
                                Text(referralCode, style: secondaryTextStyle(color: GPColorBlack)),
                                2.width,
                              ],
                            ),
                            IconButton(
                              icon: const Icon(Icons.copy, color: GPAppColor, size: 15),
                              onPressed: () {
                                toast("Coming Soon");
                              },
                            )
                          ],
                        ).onTap(() {
                          referralCode.copyToClipboard();

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('$referralCode Copied to Clipboard')),
                          );
                        })
                      ],
                    ).expand(),
                  ],
                ).paddingAll(20),
                Divider(color: Colors.grey[300], thickness: 1),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Account".toUpperCase(), style: boldTextStyle(size: 12, color: GPColorBlack)),
                    4.height,
                    Text("Signed in as: BobJohn@gpay.com", style: primaryTextStyle(size: 13)),
                    24.height,
                    accountWidget(GP_phone_icon, "Mobile Number", "+91 9876543210"),
                    24.height,
                    accountWidget(GP_payment_method_icon, "Payment methods", "GPay Bank 1234").onTap(() {
                      const GPPaymentMethodComponent().launch(context);
                    }),
                    24.height,
                    accountWidget(GP_language_icon, "Language", "English"),
                    24.height,
                    accountWidget(GP_google_icon, "Pay across Google", "Save your UPI IDs to your Google Account"),
                  ],
                ).paddingOnly(left: 20, right: 20, top: 10, bottom: 10),
                Divider(color: Colors.grey[300], thickness: 1),
                FadeTransition(
                  opacity: animationController!,
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Privacy and security".toUpperCase(), style: primaryTextStyle(size: 12, color: GPColorBlack, weight: FontWeight.bold)),
                        24.height,
                        accountWidget(GP_privacy_icon, "Privacy", "Sharing and visibility"),
                        24.height,
                        accountWidget(GP_notification, "Notifications", "Turn notifications on/off"),
                        24.height,
                        accountWidget(GP_security_icon, "Security", "Google PIN"),
                        24.height,
                        accountWidget(GP_logout, "Log out", "Log out from Pay"),
                        24.height,
                        accountWidget(GP_logout_icon, "Close account", "Clear $GPAYAppName profile on this device"),
                      ],
                    ).paddingOnly(left: 20, right: 20, top: 10, bottom: 10),
                  ),
                ),
                Divider(color: Colors.grey[300], thickness: 1),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Information".toUpperCase(), style: primaryTextStyle(size: 12, color: GPColorBlack, weight: FontWeight.bold)),
                    24.height,
                    informationWidget(GP_help_icon, "Help & feedback"),
                    24.height,
                    informationWidget(GP_dispute_icon, "Raise BBPS dispute"),
                    24.height,
                    informationWidget(GP_privacy_icon, "Terms, privacy policy and licences"),
                    24.height,
                    FutureBuilder<PackageInfo>(
                      future: PackageInfo.fromPlatform(),
                      builder: (_, snap) {
                        return informationWidget(GP_version_icon, "Version ${snap.hasData ? snap.data!.version : ''}");
                      },
                    ),
                  ],
                ).paddingOnly(left: 20, right: 20, top: 10, bottom: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }

  PreferredSize bottomAppbarWidget() => PreferredSize(
        preferredSize: Size(context.width(), 50),
        child: Container(
          padding: const EdgeInsets.only(left: 16),
          alignment: Alignment.topLeft,
          height: 50,
          color: GPAppColor,
          child: Text("Settings", style: primaryTextStyle(size: 18, color: backgroundColor)),
        ),
      );

  Widget accountWidget(String image, String title, String phoneNumber) {
    return Column(
      children: [
        Row(
          children: [
            commonCacheImageWidget(image, height: 18, width: 18, fit: BoxFit.fill),
            16.width,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: boldTextStyle(color: GPColorBlack, size: 15)),
                5.height,
                Text(phoneNumber, style: primaryTextStyle(color: GPColorBlack, size: 13)),
              ],
            )
          ],
        ),
      ],
    );
  }

  Widget informationWidget(String image, String title) {
    return Row(
      children: [
        commonCacheImageWidget(image, height: 18, width: 18, fit: BoxFit.fill),
        16.width,
        Text(title, style: boldTextStyle(color: GPColorBlack, size: 15)),
      ],
    );
  }

  dialogWidget(dialogContext) {
    return showDialog(
      barrierDismissible: true,
      context: dialogContext,
      builder: (context) {
        return AlertDialog(
          title: Text('Set profile photo', style: primaryTextStyle(color: GPColorBlack, size: 20, weight: FontWeight.bold), textAlign: TextAlign.start),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Take photo', style: primaryTextStyle(size: 16, color: GPColorBlack)).onTap(() {
                pickFromCamera();
                finish(context);
              }),
              20.height,
              Text('Choose photo', style: primaryTextStyle(size: 16, color: GPColorBlack)).onTap(() {
                pickFromGallery();
                finish(context);
              }),
            ],
          ),
        );
      },
    );
  }

  pickFromCamera() async {
    File image = File((await ImagePicker().getImage(source: ImageSource.camera, imageQuality: 100))!.path);
    setState(() {
      profileImage = image;
    });
  }

  pickFromGallery() async {
    File image = File((await ImagePicker().getImage(source: ImageSource.gallery, imageQuality: 100))!.path);

    setState(() {
      profileImage = image;
    });
  }
}
