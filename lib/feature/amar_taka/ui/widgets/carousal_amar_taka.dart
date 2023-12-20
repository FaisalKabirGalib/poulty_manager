import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../gen/assets.gen.dart';

Widget carouselItems() {
  return CarouselSlider(
    options: CarouselOptions(
      enlargeCenterPage: true,
      autoPlay: true,
      animateToClosest: true,
      enlargeStrategy: CenterPageEnlargeStrategy.scale,
      enlargeFactor: 0.4,
      viewportFraction: 0.5,
    ),
    items: [
      itemContainer(
          title: 'মোট খামার ব্যাল্যান্স',
          subtitle: '১৫০০.০০',
          backgroundCard: 'assets/icons/amar_taka_Card_1.svg'),
      itemContainer(
          title: 'পাওনা টাকার পরিমাণ',
          subtitle: '১০১৫',
          backgroundCard: 'assets/icons/amar_taka_Card_2.svg'),
      itemContainer(
          title: 'দেনা টাকার পরিমাণ',
          subtitle: '৮৬.২৭৫',
          backgroundCard: 'assets/icons/amar_taka_Card_3.svg'),
    ],
  );
}

Widget itemContainer(
    {required String backgroundCard,
    required String title,
    required String subtitle}) {
  return Stack(
    children: [
      SvgPicture.asset(
        backgroundCard,
        height: 200,
        width: 200,
        fit: BoxFit.fill,
      ),
      Positioned(
        bottom: 60,
        left: 10,
        child: Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
      Positioned(
        bottom: 35,
        left: 10,
        child: Text(
          '৳ $subtitle',
          style: const TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      )
    ],
  );
}
