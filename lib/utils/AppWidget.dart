import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import 'AppColors.dart';

BoxDecoration boxDecoration({double radius = 2, Color color = Colors.transparent, Color? bgColor, var showShadow = false}) {
  return BoxDecoration(
    color: bgColor ?? Colors.white,
    boxShadow: showShadow ? defaultBoxShadow(shadowColor: shadowColorGlobal) : [const BoxShadow(color: Colors.transparent)],
    border: Border.all(color: color),
    borderRadius: BorderRadius.all(Radius.circular(radius)),
  );
}

Function(BuildContext, String) placeholderWidgetFn() => (_, s) => placeholderWidget();

Widget placeholderWidget() => Image.asset('images/cloneApp/app/placeholder.jpg', fit: BoxFit.cover);

Widget commonCacheImageWidget(String? url, {double? width, BoxFit? fit, double? height}) {
  if (url.validate().startsWith('http')) {
    if (isMobile) {
      return CachedNetworkImage(
        placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?,
        imageUrl: '$url',
        height: height,
        width: width,
        fit: fit,
      );
    } else {
      return Image.network(url!, height: height, width: width, fit: fit);
    }
  } else {
    return Image.asset(url!, height: height, width: width, fit: fit);
  }
}

Widget settingItem(context, String text, {Function? onTap, Widget? detail, Widget? leading, Color? textColor, int? textSize, double? padding}) {
  return InkWell(
    onTap: onTap as void Function()?,
    child: Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: padding ?? 8, bottom: padding ?? 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(width: 30, alignment: Alignment.center, child: leading ?? const SizedBox()),
              leading != null ? 10.width : const SizedBox(),
              Text(text, style: primaryTextStyle(size: textSize ?? 16, color: appTextColorPrimary)).expand(),
            ],
          ).expand(),
          detail ?? const Icon(Icons.arrow_forward_ios, size: 16, color: appTextColorSecondary),
        ],
      ).paddingOnly(left: 16, right: 16, top: 8, bottom: 8),
    ),
  );
}
