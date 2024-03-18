import 'dart:async';

import 'package:gpay/utils/Colors.dart';
import 'package:flutter/material.dart';
import 'package:passcode_screen/circle.dart';
import 'package:passcode_screen/keyboard.dart';
import 'package:passcode_screen/passcode_screen.dart';

class GPPinVerifyScreen extends StatefulWidget {
  static String tag = '/GPPinVerifyScreen';

  const GPPinVerifyScreen({super.key});

  @override
  GPPinVerifyScreenState createState() => GPPinVerifyScreenState();
}

class GPPinVerifyScreenState extends State<GPPinVerifyScreen> {
  final StreamController<bool> _verificationNotifier = StreamController<bool>.broadcast();

  bool isAuthenticated = false;

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
      backgroundColor: GPColorBlack,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: GPColorBlack,
        leading: IconButton(
          color: backgroundColor,
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: backgroundColor),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          _showLockScreen(
            context,
            opaque: false,
            circleUIConfig: const CircleUIConfig(borderColor: Colors.white, fillColor: Colors.white, circleSize: 20),
            keyboardUIConfig: const KeyboardUIConfig(digitBorderWidth: 2, primaryColor: Colors.white),
            cancelButton: const Icon(Icons.arrow_back, color: Colors.blue),
            digits: ['1', '2', '3', '4', '4', '5', '6', '7', '8', '9', '0'],
          )
        ],
      ),
    );
  }

  _showLockScreen(BuildContext context, {required bool opaque, CircleUIConfig? circleUIConfig, KeyboardUIConfig? keyboardUIConfig, Widget? cancelButton, List<String>? digits}) {
    Navigator.push(
      context,
      PageRouteBuilder(
        opaque: opaque,
        pageBuilder: (context, animation, secondaryAnimation) => PasscodeScreen(
          title: const Text(
            'Enter App Passcode',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 28),
          ),
          circleUIConfig: circleUIConfig,
          keyboardUIConfig: keyboardUIConfig,
          passwordEnteredCallback: _onPasscodeEntered,
          cancelButton: cancelButton!,
          deleteButton: const Text('Delete', style: TextStyle(fontSize: 16, color: Colors.white), semanticsLabel: 'Delete'),
          shouldTriggerVerification: _verificationNotifier.stream,
          backgroundColor: Colors.black.withOpacity(0.8),
          cancelCallback: _onPasscodeCancelled,
          digits: digits,
          passwordDigits: 6,
          bottomWidget: _buildPasscodeRestoreButton(),
        ),
      ),
    );
  }

  _onPasscodeEntered(String enteredPasscode) {
    const storedPasscode = '123456';
    bool isValid = storedPasscode == enteredPasscode;
    _verificationNotifier.add(isValid);
    if (isValid) {
      setState(() {
        isAuthenticated = isValid;
      });
    }
  }

  _onPasscodeCancelled() {
    Navigator.maybePop(context);
  }

  @override
  void dispose() {
    _verificationNotifier.close();
    super.dispose();
  }

  Widget _buildPasscodeRestoreButton() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10.0, top: 20.0),
        child: TextButton(
          onPressed: _resetAppPassword,
          style: TextButton.styleFrom(
            backgroundColor: Colors.transparent,
            splashFactory: InkRipple.splashFactory,
            padding: EdgeInsets.zero,
          ),
          child: const Text(
            "Reset passcode",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w300),
          ),
        ),
      ),
    );
  }


  _resetAppPassword() {
    Navigator.maybePop(context).then((result) {
      if (!result) {
        return;
      }
      _showRestoreDialog(() {
        Navigator.maybePop(context);
      });
    });
  }

  _showRestoreDialog(VoidCallback onAccepted) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Reset passcode", style: TextStyle(color: Colors.black87)),
          content: const Text("Passcode reset is a non-secure operation!\n\nConsider removing all user data if this action performed.", style: TextStyle(color: Colors.black87)),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            TextButton(
              child: const Text("Cancel", style: TextStyle(fontSize: 18)),
              onPressed: () {
                Navigator.maybePop(context);
              },
            ),
            TextButton(
              onPressed: onAccepted,
              child: const Text("I understand", style: TextStyle(fontSize: 18)),
            ),
          ],
        );
      },
    );
  }

}
