import 'package:flutter/material.dart';
import 'package:poulty_manager/config/config.dart';
import 'package:poulty_manager/feature/intro_screens/intro_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({super.key});

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  final PageController _controller = PageController();

  bool _isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                _isLastPage = index == 2;
              });
            },
            children: const [
              IntroPage(
                  heading: 'খামারের সঠিক হিসাব রাখতে পারছেন তো ?',
                  subheading:
                      'খামারের সকল তথ্য সংরক্ষণ করুন ইনটারনেট কানেকশন ছাড়াই। আয় ও ব্যায় সহ সকল রিপোর্ট দেখুন এক ক্লিকে Poultry Manger অ্যাপে।',
                  image: AssetImage('assets/images/walkthrough_1.png')),
              IntroPage(
                  heading: 'প্রতিদিনের পোলট্রি মার্কেটের আপডেট জানতে চাচ্ছেন ?',
                  subheading:
                      ' বাচ্চা ও রেডি মুরগী সহ সব ধরনের পোল্ট্রি পন্যর বাজার আপডেট Poultry Manger অ্যাপের মাধ্যমে  জানুন সপ্তাহের ৭ দিন ২৪ ঘন্টা।',
                  image: AssetImage('assets/images/walkthrough_2.png')),
              IntroPage(
                  heading: 'ক্রেতা পাচ্ছেন না?',
                  subheading:
                      'বাংলাদেশের যে কোন হোলসেল ক্রেতার কাছে বিক্রয় করুন সবার আগে নায্য মুল্যে, Poultry Manger অ্যাপ দিয়ে।',
                  image: AssetImage('assets/images/walkthrough_3.png')),
            ],
          ),
          Container(
            alignment: const Alignment(0, 0.5),
            child: SmoothPageIndicator(
              controller: _controller,
              count: 3,
              effect: const ExpandingDotsEffect(
                dotColor: AppColors.black3Color,
                activeDotColor: AppColors.primaryColor,
                radius: 8,
                dotHeight: 4,
                dotWidth: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
