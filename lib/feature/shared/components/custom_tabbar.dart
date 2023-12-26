import 'package:flutter/material.dart';
import 'package:poulty_manager/config/config.dart';
import 'package:poulty_manager/config/constant/constant.dart';

class CustomTabBar extends StatelessWidget {
  final TabController tabController;
  final List<Widget> tabs;
  final List<Widget> tabViews;

  const CustomTabBar({
    Key? key,
    required this.tabController,
    required this.tabs,
    required this.tabViews,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        KSized.h12,
        Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Colors.black12, width: 0.6),
          ),
          child: TabBar(
            isScrollable: true,
            unselectedLabelColor: Colors.black,
            labelColor: AppColors.primaryColor,
            labelStyle: const TextStyle(
              fontSize: 16,
            ),
            dividerColor: Colors.transparent,
            dividerHeight: 0,
            indicatorColor: Colors.white,
            indicatorWeight: 2,
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
            ),
            physics: const BouncingScrollPhysics(),
            tabAlignment: TabAlignment.center,
            controller: tabController,
            tabs: tabs,
          ),
        ),
        KSized.h12,
        Expanded(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              minHeight: 200,
            ),
            child: TabBarView(
              controller: tabController,
              children: tabViews,
            ),
          ),
        ),
      ],
    );
  }
}
