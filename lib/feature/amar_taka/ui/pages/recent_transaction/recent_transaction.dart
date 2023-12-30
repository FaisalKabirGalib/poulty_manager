import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:poulty_manager/feature/amar_taka/ui/pages/recent_transaction/dena_tab_view.dart';
import 'package:poulty_manager/feature/amar_taka/ui/pages/recent_transaction/paona_tab_view.dart';
import 'package:poulty_manager/utils/widgets/custom_tabbar.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../../../core/Layout/extension.dart';
import '../../../../batch/presentation/functions/utils.dart';

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
        context.pop();
      }),
      SizedBox(
        height: MediaQuery.of(context).size.height,
        child: CustomTabBar(
          tabController: tabController,
          tabs: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.4,
              child: const Tab(text: 'পাওনা'),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.4,
              child: const Tab(text: 'দেওনা'),
            ),
          ],
          tabViews: const [
            PaonaTabView(itemCount: 8),
            DenaTabView(itemCount: 20),
          ],
        ),
      )
    ].toColumn().parent(page);
  }
}
