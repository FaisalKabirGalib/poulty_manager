import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../../config/constant/constant.dart';
import '../../../../gen/assets.gen.dart';

Widget optionsContainer(BuildContext context) {
  return Container(
    child: [
      optionItem(
        title: "জমা/উত্তলন",
        icon: Assets.icons.amarTakaOption1.svg(),
        onTap: () {
          context.push('/my-account/joma-uttolon');
        },
      ),
      optionItem(
        title: "পেমেন্ট/রিসিভ",
        icon: Assets.icons.amarTakaOption2.svg(),
        onTap: () {
          context.push('/my-account/payment-receive');
        },
      ),
      optionItem(
        title: "ব্যাংক হিসাব",
        icon: Assets.icons.amarTakaOption3.svg(),
        onTap: () {
          context.push('/my-account/bank_hishab');
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
