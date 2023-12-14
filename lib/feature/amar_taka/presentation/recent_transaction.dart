import 'package:flutter/material.dart';
import 'package:poulty_manager/feature/amar_taka/presentation/widgets/transaction_summary.dart';
import 'package:poulty_manager/feature/shared/components/custom_tabbar.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../config/constant/constant.dart';
import '../../../config/theme/color.dart';
import '../../../core/Layout/extension.dart';
import '../../batch/presentation/functions/utils.dart';

class RecentTransactionScreen extends StatefulWidget {
  const RecentTransactionScreen({super.key});

  @override
  State<RecentTransactionScreen> createState() =>
      _RecentTransactionScreenState();
}

class _RecentTransactionScreenState extends State<RecentTransactionScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final tabController = TabController(length: 2, vsync: this);
    return <Widget>[
      titleWithReturn('সম্প্রতি লেনদেন', onBack: () {
        Navigator.pop(context);
      }),
      SizedBox(
        height: MediaQuery.of(context).size.height,
        child: CustomTabBar(tabController: tabController, tabs: const [
          Tab(text: 'পাওনা'),
          Tab(text: 'দেওনা'),
        ], tabViews: [
          ListView.builder(
            itemCount: 30,
            itemBuilder: (context, index) {
              return [
                transactionSummary(),
                KSized.h4,
                const Divider(color: AppColors.dividerColor),
              ].toColumn().padding(horizontal: 20);
            },
          ),
          ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return [
                transactionSummary(),
                KSized.h4,
                const Divider(color: AppColors.dividerColor),
              ].toColumn().padding(horizontal: 20);
            },
          ),
        ]),
      )
    ].toColumn().parent(page);
  }
}
