import 'package:flutter/material.dart';
import 'package:poulty_manager/feature/amar_taka/ui/pages/joma_tab_view.dart';
import 'package:poulty_manager/feature/amar_taka/ui/pages/uttolon_tab_view.dart';
import 'package:poulty_manager/feature/shared/components/custom_tabbar.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../../core/Layout/extension.dart';
import '../../../batch/presentation/functions/utils.dart';

class BankHishabScreen extends StatefulWidget {
  const BankHishabScreen({super.key});

  @override
  State<BankHishabScreen> createState() => _BankHishabScreenState();
}

class _BankHishabScreenState extends State<BankHishabScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return [
      titleWithBackArrowAndAction(
        'ব্যাংক হিসাব',
        'এই সেকশন আপনার ফার্মের ব্যাংক হিসাব যুক্ত করুন ওনিয়মিত হিসাব সংরক্ষণ করুন।',
        onBack: () {
          Navigator.pop(context);
        },
      ),
      SizedBox(
        height: MediaQuery.of(context).size.height,
        child: CustomTabBar(tabController: tabController, tabs: const [
          Tab(text: 'জমা'),
          Tab(text: 'উত্তলন'),
        ], tabViews: const [
          // Joma Tab View

          JomaTabView(),

          // Uttolon Tab View
          UttolonTabView(),
        ]),
      )
    ].toColumn().parent(page);
  }
}
