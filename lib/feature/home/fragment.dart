import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:poulty_manager/core/Layout/extension.dart';
import 'package:styled_widget/styled_widget.dart';

import '/feature/home/widgets/slider.dart';
import '/gen/assets.gen.dart';
import '/interface/image_text.dart';
import '../../config/router/route.dart';

final secondGrid = <CreateGridItem>[
  CreateGridItem.init(Assets.images.bikroyOnurodh, 'বিক্রয় অনুরোধ'),
  CreateGridItem.init(Assets.images.poultryMarket, 'পোল্ট্রি মার্কেট'),
  CreateGridItem.init(Assets.images.khabarerMojud, 'খামারি মজুদ'),
  CreateGridItem.init(Assets.images.bazarBisleshon, 'বাজার বিশ্লেষণ'),
  CreateGridItem.init(Assets.images.farmReporting, 'ফার্ম রিপোর্টিং'),
  CreateGridItem.init(Assets.images.poultryNews, 'পোলট্রি নিউজ'),
  CreateGridItem.init(Assets.images.rogPotikar, 'রোগ ও প্রতিকার'),
  CreateGridItem.init(Assets.images.farmacyList, 'ফার্মেসি লিস্ট'),
  CreateGridItem.init(Assets.images.dealerList, 'ডিলার লিস্ট'),
  CreateGridItem.init(Assets.images.doctorList, 'ডাক্তার লিস্ট'),
  CreateGridItem.init(Assets.images.kretaList, 'ক্রেতা লিস্ট'),
  CreateGridItem.init(Assets.images.kormiList, 'কর্মী লিস্ট'),
];

class HomeFragments extends StatelessWidget {
  const HomeFragments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      primary: false,
      shrinkWrap: true,
      children: [
        Assets.images.henVideo.image(),
        const SizedBox(
          height: 2,
        ),
        const HomeSlider().padding(all: 4),
        [
          CreateGridItem(
            image: Assets.images.hen.image(
              height: 50,
              width: 50,
            ),
            text: Styled.text('ব্যাচ লিস্ট'),
            onPressed: () {
              context.pushNamed(AppRouteName.batch.name);
            },
          ),
          CreateGridItem(
            image: Assets.images.amarTaka.image(
              height: 50,
              width: 50,
            ),
            text: Styled.text('আমার টাকা'),
            onPressed: () {},
          ),
          CreateGridItem(
            image: Assets.images.khabarerMojud.image(
              height: 50,
              width: 50,
            ),
            text: Styled.text('খামারি ঘর'),
            onPressed: () {},
          ),
          CreateGridItem(
            image: Assets.images.inbox.image(
              height: 50,
              width: 50,
            ),
            text: Styled.text('ইনবক্স'),
            onPressed: () {},
          ),
        ].grid(
          primary: false,
          shrinkWrap: true,
        ),
        secondGrid.grid(
          primary: false,
          shrinkWrap: true,
        ),
        [
          CreateGridItem.init(Assets.images.poultryRin, 'পোলট্রি ঋণ'),
          CreateGridItem.init(Assets.images.sahajjerJonno, 'সাহায্যর জন্য'),
          CreateGridItem.init(
              Assets.images.affiliatePartner, 'অ্যাফিলিয়েট পার্টনার'),
          CreateGridItem.init(
              Assets.images.allCalculator, 'সকল ক্যালকুল্যাটার'),
          CreateGridItem.init(
              Assets.images.praniSompod, 'প্রাণী সম্পদ অধিদপ্তর'),
          CreateGridItem.init(Assets.images.setting, 'সেটিং')
        ].grid(
          primary: false,
          shrinkWrap: true,
        ),
      ],
    ).parent(page);
  }
}
