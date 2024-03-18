import 'package:gpay/model/Model.dart';
import 'package:gpay/utils/Colors.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class GPChatMessageWidget extends StatelessWidget {
  const GPChatMessageWidget({
    Key? key,
    required this.isMe,
    required this.data,
  }) : super(key: key);

  final bool isMe;
  final GPMessageModel data;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: isMe.validate() ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 14, bottom: 14),
          margin: isMe.validate() ? EdgeInsets.only(top: 3.0, bottom: 3.0, right: 0, left: (context.width() * 0.25).toDouble()) : EdgeInsets.only(top: 4.0, bottom: 4.0, left: 0, right: (context.width() * 0.25).toDouble()),
          decoration: BoxDecoration(
            color: !isMe ? Colors.grey[200] : Colors.white,
            borderRadius: isMe.validate() ? const BorderRadius.all(Radius.circular(24)) : const BorderRadius.all(Radius.circular(24)),
            border: Border.all(color: isMe ? Colors.grey[300]! : Colors.transparent),
          ),
          child: Column(
            crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(child: Text(data.msg!, style: primaryTextStyle(color: isMe ? GPColorBlack : GPColorBlack))),
            ],
          ),
        )
      ],
    );
  }
}
