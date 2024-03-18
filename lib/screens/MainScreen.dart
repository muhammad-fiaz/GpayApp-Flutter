import 'package:gpay/screens/HomeScreen.dart';
import 'package:gpay/screens/QrScannerComponent.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class MainScreen extends StatefulWidget {
  static String tag = '/MainScreen';

  const MainScreen({super.key});

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  PageController? controller;
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    controller = PageController(initialPage: currentPage);

    setStatusBarColor(Colors.black, statusBarIconBrightness: Brightness.dark, statusBarBrightness: Brightness.dark);
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        body: PageView(
          reverse: true,
          pageSnapping: true,
          onPageChanged: (index) {
            currentPage = index;
          },
          children: [
            const GPHomeScreen(),
            GPQrScannerComponent(),
          ],
        ),
      ),
    );
  }
}
