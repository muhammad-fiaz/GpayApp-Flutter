import 'package:gpay/components/businesses/BusinessesComponent.dart';
import 'package:gpay/components/peopleAndBills/PeopleAndBillsComponent.dart';
import 'package:gpay/utils/Colors.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class ExploreScreen extends StatefulWidget {
  static String tag = '/ExploreScreen';
  int? tabIndex;

  ExploreScreen({super.key, this.tabIndex});

  @override
  ExploreScreenState createState() => ExploreScreenState();
}

class ExploreScreenState extends State<ExploreScreen> with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  bool isStopped = false;
  var searchController = TextEditingController();

  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    setStatusBarColor(Colors.black, statusBarIconBrightness: Brightness.light, statusBarBrightness: Brightness.dark);
    _tabController = TabController(length: 2, vsync: this, initialIndex: widget.tabIndex.validate());
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: backgroundColor,
          automaticallyImplyLeading: false,
          titleSpacing: 0,
          leadingWidth: 0,
          centerTitle: true,
          elevation: 2,
          title: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.keyboard_backspace, color: GPColorBlack),
                onPressed: () {
                  finish(context);
                },
              ),
              TextFormField(
                controller: searchController,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 0),
                  border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(25.0))),
                  enabledBorder: OutlineInputBorder(borderRadius: const BorderRadius.all(Radius.circular(25.0)), borderSide: BorderSide(color: Colors.grey[300]!)),
                  focusedBorder: OutlineInputBorder(borderRadius: const BorderRadius.all(Radius.circular(25.0)), borderSide: BorderSide(color: Colors.grey[300]!)),
                  disabledBorder: OutlineInputBorder(borderRadius: const BorderRadius.all(Radius.circular(25.0)), borderSide: BorderSide(color: Colors.grey[300]!)),
                  hintText: 'Search for people',
                  hintStyle: secondaryTextStyle(size: 12),
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                ),
                onTap: () {
                  //   hideKeyboard(context);
                },
              ).expand(),
              PopupMenuButton(
                icon: const Icon(Icons.more_vert_outlined, color: GPColorBlack),
                onSelected: (dynamic v) {
                  toast('Click');
                },
                itemBuilder: (BuildContext context) {
                  List<PopupMenuEntry<Object>> list = [];

                  list.add(const PopupMenuItem(value: 1, child: Text("Refresh", style: TextStyle(color: GPColorBlack))));
                  list.add(const PopupMenuItem(value: 1, child: Text("Send feedback", style: TextStyle(color: GPColorBlack))));
                  return list;
                },
              )
            ],
          ).paddingOnly(top: 5, bottom: 5),
          bottom: TabBar(
            controller: _tabController,
            unselectedLabelColor: Colors.black54,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: GPAppColor,
            labelColor: GPAppColor,
            labelStyle: secondaryTextStyle(size: 14),
            tabs: const [
              Tab(text: "People & bills"),
              Tab(text: "Businesses"),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: const [
            PeopleAndBillsComponent(),
            BusinessesComponent(),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
