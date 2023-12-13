import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
        assetColor: const Color(0XFF00D054),
        containerColor: const Color(0XFF00B74A),
        title: 'মোট খামার ব্যাল্যান্স',
        subtitle: '১৫০০.০০',
      ),
      itemContainer(
        assetColor: const Color(0XFF3AAAFF),
        containerColor: const Color(0XFF179BFF),
        title: 'পাওনা টাকার পরিমাণ',
        subtitle: '১০১৫',
      ),
      itemContainer(
        assetColor: const Color(0XFFFF5676),
        containerColor: const Color(0XFFFF2B52),
        title: 'দেনা টাকার পরিমাণ',
        subtitle: '৮৬.২৭৫',
      ),
    ],
  );
}

Widget itemContainer({assetColor, containerColor, title, subtitle}) {
  return Container(
    height: 177,
    width: 177,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: containerColor,
    ),
    child: Stack(
      children: [
        Positioned(
          top: 10,
          left: 10,
          child: SvgPicture.asset(
            'assets/icons/chicken.svg',
            color: assetColor,
            height: 30,
            width: 30,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 40,
          left: 10,
          child: Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
        Positioned(
          bottom: 15,
          left: 10,
          child: Text(
            '৳ $subtitle',
            style: const TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        )
      ],
    ),
  );
}
