import 'dart:io';

import 'package:gpay/components/camera/page/camera.dart';
import 'package:gpay/screens/MainScreen.dart';
import 'package:gpay/utils/Colors.dart';
import 'package:gpay/utils/Images.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class GPQrScannerComponent extends StatefulWidget {
  static String tag = '/GPQrScannerComponent';
  String? screenName;

  GPQrScannerComponent({super.key, this.screenName});

  @override
  GPQrScannerComponentState createState() => GPQrScannerComponentState();
}

class GPQrScannerComponentState extends State<GPQrScannerComponent> {
  File? val;

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
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              Center(child: cameraWidget()),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.close, color: backgroundColor),
                    onPressed: () {
                      if (widget.screenName == "PeopleAndBillsScreen") {
                        finish(context);
                      } else {
                        const MainScreen().launch(context);
                      }
                    },
                  ),
                  Image.asset(GP_focus, height: 24, width: 24, color: backgroundColor).onTap(() {})
                ],
              ).paddingOnly(left: 12, right: 12, top: 0),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Scan QR code to pay", style: primaryTextStyle(size: 14, color: backgroundColor)),
                    Text("Scan Spot Code to connect", style: primaryTextStyle(size: 14, color: backgroundColor)),
                    120.height,
                    Container(
                      padding: const EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 8),
                      width: 200,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(25)), color: Colors.black.withOpacity(0.5)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(GP_brightness_icon, height: 20, width: 20, color: backgroundColor),
                          10.width,
                          Text("Show my Spot Code", style: primaryTextStyle(size: 14, color: backgroundColor), textAlign: TextAlign.center),
                        ],
                      ),
                    ),
                  ],
                ),
              ).paddingBottom(16)
            ],
          ),
        ),
      ),
      onWillPop: () async {
        if (widget.screenName == "PeopleAndBillsScreen") {
          finish(context);
        } else {
          const MainScreen().launch(context);
        }
        return true;
      },
    );
  }
}

Widget cameraWidget() {
  return Camera(
    mode: CameraMode.normal,
    initialCamera: CameraSide.back,
    enableCameraChange: false,
    imageMask: Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(GP_camera_bg, height: 310, width: 310),
        Container(alignment: Alignment.center, decoration: boxDecorationWithRoundedCorners(borderRadius: radius(22), backgroundColor: Colors.white.withOpacity(0.2)), height: 270, width: 270),
      ],
    ),
    orientationEnablePhoto: CameraOrientation.landscape,
    onChangeCamera: (direction, _) {
      print('--------------');
      print('$direction');
      print('--------------');
    },
  );
}
