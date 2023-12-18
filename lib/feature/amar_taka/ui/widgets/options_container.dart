import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:poulty_manager/feature/amar_taka/ui/pages/joma_uttolon_screen.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../../config/constant/constant.dart';

Widget optionsContainer(context) {
  return Container(
    child: [
      optionItem(
        title: "জমা/উত্তলন",
        icon: "assets/icons/amar_taka_option_1.svg",
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const JomaUttolonScreen(),
            ),
          );
        },
      ),
      optionItem(
        title: "পেমেন্ট/রিসিভ",
        icon: "assets/icons/amar_taka_option_2.svg",
        onTap: () {},
      ),
      optionItem(
        title: "ব্যাংক হিসাব",
        icon: "assets/icons/amar_taka_option_3.svg",
        onTap: () {},
      ),
    ].toRow(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
    ),
  );
}

Widget optionItem({title, icon, onTap}) {
  return [
    SvgPicture.asset(icon),
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
