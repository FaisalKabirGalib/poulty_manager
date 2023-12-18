import 'package:flutter/material.dart';
import 'package:poulty_manager/config/constant/constant.dart';
import 'package:poulty_manager/feature/amar_taka/ui/pages/joma_tab_view.dart';
import 'package:poulty_manager/feature/amar_taka/ui/pages/uttolon_tab_view.dart';
import 'package:poulty_manager/feature/shared/components/custom_tabbar.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../../config/theme/color.dart';
import '../../../../core/Layout/extension.dart';
import '../../../batch/presentation/functions/utils.dart';

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
        'জমা/উত্তলন',
        'এই সেকশন আপনার ফার্মের টাকা জমা করতে পারবেন এবং টাকা উত্তোলন করতে পারবেন। ',
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
