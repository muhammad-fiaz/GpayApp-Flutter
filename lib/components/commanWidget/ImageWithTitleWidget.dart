import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class ImageWithTitleWidget extends StatelessWidget {
  static String tag = '/SettingWidget';
  final String image;
  final String name;

  final String title;

  const ImageWithTitleWidget(this.image, this.name, this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: Colors.grey,
          child: CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage(image),
          ),
        ),
        15.width,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: primaryTextStyle(
                size: 14,
              ),
            ),
            Text(
              title,
              style: secondaryTextStyle(
                size: 12,
              ),
            ),
          ],
        ),
      ],
    ).paddingOnly(left: 8,right: 8,top: 16,bottom: 16);
  }
}
