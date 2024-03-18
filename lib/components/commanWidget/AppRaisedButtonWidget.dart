import 'package:gpay/utils/Colors.dart';
import 'package:flutter/material.dart';

class AppRaisedButton extends StatelessWidget {
  String? title;
  Widget? child;
  Color? color;
  double height;
  double? width;
  double borderRadius;
  Color titleColor;
  double titleSize;
  FontWeight titleFontWeight;
  Function? onPressed;
  TextAlign textAlign;

  AppRaisedButton({super.key, 
    this.title,
    this.child,
    this.color = GPAppColor,
    this.height = 40.0,
    this.width,
    this.borderRadius = 0,
    this.titleColor = Colors.white,
    this.titleSize = 16.0,
    this.titleFontWeight = FontWeight.bold,
    this.onPressed,
    this.textAlign = TextAlign.center,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed as void Function()?,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius)),
        ),
        child: title != null
            ? Text(
          title!,
          style: TextStyle(color: titleColor, fontSize: titleSize, fontWeight: titleFontWeight),
          maxLines: 1,
          textAlign: textAlign,
        )
            : child,
      )

    );
  }
}
