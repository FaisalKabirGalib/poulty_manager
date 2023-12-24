import 'package:flutter/material.dart';
import 'package:poulty_manager/feature/amar_taka/ui/pages/payment_receive/batch_hishab_tabview.dart';
import 'package:poulty_manager/feature/amar_taka/ui/pages/payment_receive/beton_porishod_tabview.dart';
import 'package:poulty_manager/feature/amar_taka/ui/pages/joma_uttolon/joma_tab_view.dart';
import 'package:poulty_manager/feature/amar_taka/ui/pages/joma_uttolon/uttolon_tab_view.dart';
import 'package:poulty_manager/feature/shared/components/custom_tabbar.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../../../core/Layout/extension.dart';
import '../../../../batch/presentation/functions/utils.dart';

class PaymentReceiveScreen extends StatefulWidget {
  const PaymentReceiveScreen({super.key});

  @override
  State<PaymentReceiveScreen> createState() => _PaymentReceiveScreenState();
}

class _PaymentReceiveScreenState extends State<PaymentReceiveScreen>
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
        'পেমেন্ট',
        'এই সেকশন আপনার ফার্মের টাকা জমা করতে পারবেন এবং টাকা উত্তোলন করতে পারবেন।',
        onBack: () {
          Navigator.pop(context);
        },
      ),
      SizedBox(
        height: MediaQuery.of(context).size.height,
        child: CustomTabBar(
          tabController: tabController,
          tabs: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.4,
              child: const Tab(text: 'বেতন পরিশোধ'),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.4,
              child: const Tab(text: 'ব্যাচ হিসাব'),
            ),
          ],
          tabViews: const [
            BetonPorishodTabView(),
            BatchHishabTabView(),
          ],
        ),
      )
    ].toColumn().parent(page);
  }
}
