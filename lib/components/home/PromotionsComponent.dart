import 'package:gpay/components/home/prmotions/OfferComponent.dart';
import 'package:gpay/components/home/prmotions/ReferralsComponent.dart';
import 'package:gpay/components/home/prmotions/RewardComponent.dart';
import 'package:gpay/model/Model.dart';
import 'package:gpay/utils/Colors.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class PromotionsList extends StatelessWidget {
  const PromotionsList({
    Key? key,
    required this.getPromotionsList,
  }) : super(key: key);

  final List<GPPeopleModel> getPromotionsList;

  @override
  Widget build(BuildContext context) {
    return PromotionsListComponent(getPromotionsList: getPromotionsList);
  }
}

class PromotionsListComponent extends StatefulWidget {
  const PromotionsListComponent({
    Key? key,
    required this.getPromotionsList,
  }) : super(key: key);

  final List<GPPeopleModel> getPromotionsList;

  @override
  _PromotionsListComponentState createState() => _PromotionsListComponentState();
}

class _PromotionsListComponentState extends State<PromotionsListComponent> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      scrollDirection: Axis.vertical,
      itemCount: widget.getPromotionsList.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4, mainAxisSpacing: 2.0, crossAxisSpacing: 4.0, childAspectRatio: 1.0),
      itemBuilder: (context, index) {
        GPPeopleModel mData = widget.getPromotionsList[index];
        return Column(
          children: [
            CircleAvatar(radius: 26, backgroundColor: black, backgroundImage: AssetImage(mData.userImg)),
            5.height,
            Text(mData.userName, style: primaryTextStyle(size: 14, color: GPColorBlack)),
          ],
        ).onTap(() {
          if (index == 0) {
            const GPRewardComponent().launch(context);
          } else if (index == 1) {
            const GPOfferComponent().launch(context);
          } else if (index == 2) {
            const GPReferralsComponent().launch(context);
          }
        });
      },
    );
  }
}
