import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:poulty_manager/feature/amar_taka/ui/pages/payment_receive_screen.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../../config/constant/constant.dart';
import '../../../../gen/assets.gen.dart';
import '../pages/bank_hishab_screen.dart';
import '../pages/joma_uttolon_screen.dart';

Widget optionsContainer(context) {
  return Container(
    child: [
      optionItem(
        title: "জমা/উত্তলন",
        // icon: "assets/icons/amar_taka_option_1.svg",
        icon: Assets.icons.amarTakaOption1.svg(),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const JomaUttolonScreen(),
            ),
          );

          // context.push('/joma-uttolon');
          // GoRouter.of(context).push('/joma-uttolon');
        },
      ),
      optionItem(
        title: "পেমেন্ট/রিসিভ",
        icon: Assets.icons.amarTakaOption2.svg(),
        onTap: () {
          // context.push('/payment-receive');
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const PaymentReceiveScreen();
          }));
        },
      ),
      optionItem(
        title: "ব্যাংক হিসাব",
        icon: Assets.icons.amarTakaOption3.svg(),
        onTap: () {
          // context.push('/bank_hishab');
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const BankHishabScreen();
          }));
        },
      ),
    ].toRow(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
    ),
  );
}

Widget optionItem({
  required String title,
  required Widget icon,
  required VoidCallback onTap,
}) {
  return [
    icon,
    KSized.h8,
    Styled.text(
      title,
      style: const TextStyle(
        fontSize: 14,
        color: Colors.grey,
      ),
    ),
  ]
      .toColumn(
        mainAxisAlignment: MainAxisAlignment.center,
      )
      .gestures(onTap: onTap);
}
