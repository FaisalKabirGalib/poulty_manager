import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:poulty_manager/feature/amar_taka/ui/pages/joma_uttolon/joma_tab_view.dart';
import 'package:poulty_manager/feature/amar_taka/ui/pages/joma_uttolon/uttolon_tab_view.dart';
import 'package:poulty_manager/utils/widgets/custom_tabbar.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../../../core/Layout/extension.dart';
import '../../../../batch/presentation/functions/utils.dart';

class JomaUttolonScreen extends StatefulWidget {
  const JomaUttolonScreen({super.key});

  @override
  State<JomaUttolonScreen> createState() => _JomaUttolonScreenState();
}

class _JomaUttolonScreenState extends State<JomaUttolonScreen>
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
        'জমা/উত্তোলন',
        'এই সেকশন আপনার ফার্মের টাকা জমা করতে পারবেন এবং টাকা উত্তোলন করতে পারবেন। ',
        onBack: () {
          context.pop();
        },
      ),
      SizedBox(
        height: MediaQuery.of(context).size.height,
        child: CustomTabBar(
          tabController: tabController,
          tabs: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.4,
              child: const Tab(text: 'জমা'),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.4,
              child: const Tab(text: 'উত্তোলন'),
            ),
          ],
          tabViews: [
            // Joma Tab View

            JomaTabView(),

            // Uttolon Tab View
            UttolonTabView(),
          ],
        ),
      )
    ].toColumn().parent(page);
  }
}
