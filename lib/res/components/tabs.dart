import 'package:flutter/material.dart';
import 'package:wallet_app/res/colors.dart';
import 'package:wallet_app/res/components/tabsComponents/activity.dart';
import 'package:wallet_app/res/components/tabsComponents/tokens.dart';

// Tabs ......

class TabsController extends StatefulWidget {
  const TabsController({super.key});

  @override
  State<TabsController> createState() => _TabsControllerState();
}

class _TabsControllerState extends State<TabsController>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 2, vsync: this);
    return SizedBox(
      height: MediaQuery.of(context).size.height*0.30,
      child: Center(
        child: Column(
          children: [
            SizedBox(
              height: 60,
              child: TabBar(
                  controller: tabController,
                  labelPadding: const EdgeInsets.symmetric(horizontal: 60),
                  isScrollable: true,
                  tabAlignment: TabAlignment.center,
                  dividerColor: ColorsApp.background,
                  indicatorColor: ColorsApp.white,
                  tabs: const [
                    Tab(
                      child: Text(
                        "Tokens",
                        style: TextStyle(color: ColorsApp.white, fontSize: 14),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Activity",
                        style: TextStyle(color: ColorsApp.white, fontSize: 14),
                      ),
                    )
                  ]),
            ),
             Expanded(
                child: TabBarView(
                  controller: tabController,
              children: const [
                 TokensList(),
                 ActivityList()
              ],
            ))
          ],
        ),
      ),
    );
  }
}
