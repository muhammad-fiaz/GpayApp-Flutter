import 'package:gpay/model/Model.dart';
import 'package:gpay/utils/Colors.dart';
import 'package:gpay/utils/DataProvider.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class ProviderSuggestionComponent extends StatefulWidget {
  static String tag = '/ProviderSuggestionComponent';

  const ProviderSuggestionComponent({super.key});

  @override
  ProviderSuggestionComponentState createState() => ProviderSuggestionComponentState();
}

class ProviderSuggestionComponentState extends State<ProviderSuggestionComponent> {
  late List<GPPeopleModel> getProviderSuggestionList;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    getProviderSuggestionList = getBusinessData();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: getProviderSuggestionList.length,
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemBuilder: (context, index) {
          GPPeopleModel mData = getProviderSuggestionList[index];
          return SizedBox(
            width: 80,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(radius: 24, backgroundColor: black, backgroundImage: AssetImage(mData.userImg)),
                10.height,
                Text(
                  mData.userName,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  softWrap: false,
                  style: primaryTextStyle(size: 14, color: GPColorBlack),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
