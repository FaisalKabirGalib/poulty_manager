import 'package:flutter/material.dart';

import '../../config/theme/color.dart';
import '../../gen/assets.gen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [
            Positioned.fill(
              child: Assets.images.appHen.image(
                height: 200,
                width: 200,
              ),
            ),
            const Positioned(
              bottom: 100,
              child: Text(
                'ভাষা সিলেক্ট করুন।',
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.black2Color,
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 60,
                decoration: BoxDecoration(
                  color: const Color(0XFFF3F4F6),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TabBar(
                    tabs: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: const Tab(text: 'বাংলা')),
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: const Tab(text: 'English')),
                    ],
                    labelColor: AppColors.primaryColor,
                    labelStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    unselectedLabelColor: AppColors.blackColor,
                    unselectedLabelStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    indicator: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    // dividerHeight: 0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
