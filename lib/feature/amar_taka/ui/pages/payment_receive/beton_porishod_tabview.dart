import 'package:flutter/material.dart';
import 'package:poulty_manager/feature/amar_taka/ui/widgets/balance_display.dart';

class BetonPorishodTabView extends StatelessWidget {
  const BetonPorishodTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        BalanceDisplay(balance: '1500'),
      ],
    );
  }
}
