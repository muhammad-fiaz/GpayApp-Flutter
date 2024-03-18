import 'package:gpay/model/Model.dart';
import 'package:gpay/utils/Colors.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class BusinessList extends StatelessWidget {
  const BusinessList({
    Key? key,
    required this.getBusinessList,
  }) : super(key: key);

  final List<GPPeopleModel> getBusinessList;

  @override
  Widget build(BuildContext context) {
    return BusinessListComponent(getBusinessList: getBusinessList);
  }
}

class BusinessListComponent extends StatefulWidget {
  const BusinessListComponent({
    Key? key,
    required this.getBusinessList,
  }) : super(key: key);

  final List<GPPeopleModel> getBusinessList;

  @override
  _BusinessListComponentState createState() => _BusinessListComponentState();
}

class _BusinessListComponentState extends State<BusinessListComponent> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.only(right: 5, left: 5),
      scrollDirection: Axis.vertical,
      itemCount: widget.getBusinessList.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4, mainAxisSpacing: 0.0, crossAxisSpacing: 16.0, childAspectRatio: 1.0),
      itemBuilder: (context, index) {
        GPPeopleModel mData = widget.getBusinessList[index];
        return Column(
          children: [
            CircleAvatar(radius: 26, backgroundColor: black, backgroundImage: AssetImage(mData.userImg)),
            5.height,
            Text(mData.userName, maxLines: 1, overflow: TextOverflow.ellipsis, style: primaryTextStyle(size: 12, color: GPColorBlack)),
          ],
        );
      },
    );
  }
}
