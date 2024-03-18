import 'package:gpay/utils/AppWidget.dart';
import 'package:gpay/utils/Colors.dart';
import 'package:gpay/utils/Images.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:share/share.dart';

class GPProfileDetailsScreenComponent extends StatefulWidget {
  static String tag = '/GPProfileDetailsScreenComponent';

  const GPProfileDetailsScreenComponent({super.key});

  @override
  GPProfileDetailsScreenComponentState createState() => GPProfileDetailsScreenComponentState();
}

class GPProfileDetailsScreenComponentState extends State<GPProfileDetailsScreenComponent> {
  var pageController = PageController();
  List<Widget> pages = [];
  var selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    pages = [scanMySpotCodeWidget(context), qrScannerWidget()];
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: backgroundColor,
          body: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.close, color: GPColorBlack),
                    onPressed: () {
                      finish(context);
                    },
                  ).paddingLeft(12),
                  DotIndicator(pages: pages, pageController: pageController, indicatorColor: Colors.grey).expand(),
                  PopupMenuButton(
                    icon: const Icon(Icons.more_vert_outlined, color: GPColorBlack),
                    onSelected: (dynamic v) {},
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
              15.height,
              PageView(
                controller: pageController,
                scrollDirection: Axis.horizontal,
                children: pages,
                onPageChanged: (index) {
                  selectedIndex = index;
                  setState(() {});
                },
              ).expand(),
            ],
          )),
    );
  }
}
Widget scanMySpotCodeWidget(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    mainAxisSize: MainAxisSize.min,
    children: [
      const CircleAvatar(
        radius: 140,
        backgroundImage: AssetImage(GP_dotted_profile_img),
        child: Stack(
          children: [
            CircleAvatar(radius: 50, backgroundImage: AssetImage(GPAY_user)),
          ],
        ),
      ),
      const SizedBox(height: 20),
      Text("Andrew Lincon", style: primaryTextStyle(size: 22, color: GPColorBlack)),
      const SizedBox(height: 15),
      Text("Scan my Spot Code to connect", style: primaryTextStyle(size: 14, color: GPColorBlack)),
      const SizedBox(height: 60),
      Container(
        padding: const EdgeInsets.only(left: 60, right: 60),
        child: ElevatedButton(
          onPressed: () async {
            await Share.share('share Link');
          },
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ),
            ),
            backgroundColor: MaterialStateProperty.all<Color>(GPAppColor),
            foregroundColor: MaterialStateProperty.all<Color>(backgroundColor),
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.all(8)),
          ),
          child: const Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.share, color: backgroundColor),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  "Share profile link",
                  style: TextStyle(
                    color: backgroundColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
      const SizedBox(height: 10),
      Container(
        padding: const EdgeInsets.only(left: 60, right: 60),
        child:ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(color: Colors.grey[300]!),
              ),
            ),
            backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.grey),
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.all(8)),
          ),
          onPressed: () {},
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(Icons.qr_code_scanner, color: Colors.grey),
              const SizedBox(width: 8), // Add some space between icon and text
              Text(
                "Open scanner",
                style: primaryTextStyle(color: Colors.grey, size: 14, weight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const Spacer(), // Use Spacer widget to push text to the right
            ],
          ),
        )

      ),
    ],
  );
}

Widget qrScannerWidget() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      commonCacheImageWidget(GP_qr_scanner_img_big, height: 280, width: 280, fit: BoxFit.fill),
      20.height,
      Text("BobJohn@gpay.com", style: secondaryTextStyle(size: 12)),
      30.height,
      Text("Bob John", style: primaryTextStyle(size: 18, color: GPColorBlack, weight: FontWeight.bold)),
      15.height,
      Text("BobJohn@gpay.com", style: primaryTextStyle(size: 13, color: GPColorBlack)),
      Text("+91 9876543210", style: primaryTextStyle(size: 13, color: GPColorBlack)),
      20.height,
      Text("Scan my code to pay", style: primaryTextStyle(size: 14, color: GPColorBlack)),
      60.height,
      Padding(
        padding: const EdgeInsets.only(left: 60, right: 60),
        child: TextButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(color: Colors.grey[300]!),
              ),
            ),
            backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.grey),
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.all(8)),
          ),
          onPressed: () {},
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.qr_code_scanner, color: Colors.grey),
              const SizedBox(width: 8),
              Text(
                "Open scanner",
                style: primaryTextStyle(color: Colors.grey, size: 14, weight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    ],
  );
}


