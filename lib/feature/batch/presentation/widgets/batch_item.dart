// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:poulty_manager/utils/widgets/dialog_helper.dart';
import 'package:styled_widget/styled_widget.dart';

import '/config/constant/constant.dart';
import '/feature/batch/domain/domain.dart';
import '/feature/batch/presentation/widgets/two_text_column.dart';
import '/interface/image_text.dart';
import '../../../../config/theme/color.dart';
import '../../../../gen/assets.gen.dart';

class SingleBatchShow extends HookWidget {
  final ModelBatch batch;
  final int serial;
  const SingleBatchShow({
    super.key,
    required this.batch,
    required this.serial,
  });

  @override
  Widget build(BuildContext context) {
    final isExpanded = useState(serial == 1);
    if (isExpanded.value) {
      return BatchExpand(
        batch: batch,
        serialNo: serial,
        onTap: () {
          isExpanded.value = false;
        },
      );
    }
    return InitWidget(
      serialNo: serial,
      batchName: batch.poultryName,
      startDate: batch.hatchDateFormatted ?? "",
      batchId: "${batch.id}",
      onTap: () {
        isExpanded.value = true;
      },
    );
  }
}

class InitWidget extends StatelessWidget {
  final int serialNo;
  final String batchName;
  final String startDate;
  final String batchId;
  final VoidCallback? onTap;
  const InitWidget({
    Key? key,
    required this.serialNo,
    required this.batchName,
    required this.startDate,
    required this.batchId,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return [
      [
        Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Styled.text("$serialNo"),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Styled.text(batchName),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Styled.text(startDate),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Styled.text(batchId),
        ),
      ].toRow(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      ),
      const SizedBox(
        height: 20,
      ),
      Styled.text("বিস্তারিত")
          .padding(horizontal: 16, vertical: 6)
          .decorated(
            border: Border.all(
              color: AppColors.primaryColor,
            ),
            color: AppColors.primaryColor.withAlpha(50),
            borderRadius: BorderRadius.circular(6),
          )
          .gestures(onTap: onTap)
    ].toColumn().padding(all: 6).card(color: Colors.white);
  }
}

class BatchExpand extends StatelessWidget {
  const BatchExpand({
    Key? key,
    required this.batch,
    required this.serialNo,
    this.onTap,
  }) : super(key: key);

  final ModelBatch batch;
  final int serialNo;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        KSized.h12,
        [
          TwoTextColumn(uppertext: "নং", lowerText: "$serialNo"),
          TwoTextColumn(
              uppertext: "ব্যাচের নামঃ", lowerText: batch.poultryName),
          TwoTextColumn(
              uppertext: "শুরুর তারিখ",
              lowerText: batch.hatchDateFormatted ?? "no Date"),
          TwoTextColumn(uppertext: "ব্যাচ ID", lowerText: "${batch.id}"),
        ]
            .toRow(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            )
            .constrained(minHeight: 40, maxHeight: 60),
        Padding(
          padding: const EdgeInsets.only(top: 24, left: 8, right: 8),
          child: GridView.count(
            shrinkWrap: true,
            primary: false,
            crossAxisCount: 2,
            childAspectRatio: 2.5,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            children: [
              BatchSmallCardShow(
                title: "মোট জীবিত মুরগী",
                value: batch.totalAliveChicks,
                image: Assets.icons.henOutline.svg(),
                backgroundImage: Assets.icons.bmCardBg1.svg(),
              ),
              BatchSmallCardShow(
                title: "মুর্গির গড় ওজন",
                value: batch.avgWeight,
                image: Assets.icons.weight.svg(),
                backgroundImage: Assets.icons.bmCardBg2.svg(),
              ),
              BatchSmallCardShow(
                title: "উৎপাদন ব্যায় (কেজি)",
                value: batch.manufactureCostKg,
                image: Assets.icons.uppadon.svg(),
                backgroundImage: Assets.icons.bmCardBg3.svg(),
              ),
              BatchSmallCardShow(
                title: "মোট ব্যায়",
                value: batch.totalCost,
                image: Assets.icons.totalBai.svg(),
                backgroundImage: Assets.icons.bmCardBg4.svg(),
              ),
            ],
          ),
        ),

        KSized.h12,

        // Grid Items
        [
          CreateGridItem(
            image: Assets.images.totthoHalnagad.image(
              height: 50,
            ),
            text: Styled.text("তথ্য হালনাগাদ")
                .fontSize(10)
                .fontWeight(FontWeight.w500),
            onPressed: () {
              context.push("/info-update/${batch.id}");
            },
          ),
          CreateGridItem(
            image: Assets.images.doctorVisit.image(
              height: 50,
            ),
            text: Styled.text("ডাক্তার ভিজিট")
                .fontSize(10)
                .fontWeight(FontWeight.w500),
            onPressed: () {
              context.push("/doctor-visit/${batch.id}");
            },
          ),
          CreateGridItem(
            image: Assets.images.poramorshoProtidin.image(
              height: 50,
            ),
            text: Styled.text("পরামর্শ প্রতিদিন")
                .fontSize(10)
                .fontWeight(FontWeight.w500),
            onPressed: () {
              context.push("/daily-advice/${batch.id}");
            },
          ),
          CreateGridItem(
            image: Assets.images.vaccineTottho.image(
              height: 50,
            ),
            text: Styled.text("ভ্যাক্সিন তথ্য")
                .fontSize(10)
                .fontWeight(FontWeight.w500),
            onPressed: () {
              context.push("/vaccine/${batch.id}");
            },
          ),
          CreateGridItem(
            image: Assets.images.finalReport.image(
              height: 50,
            ),
            text: Styled.text("ফাইনাল রিপোর্ট")
                .fontSize(10)
                .fontWeight(FontWeight.w500),
            onPressed: () {
              context.push("/report/${batch.id}");
            },
          ),
          CreateGridItem(
            image: Assets.images.osudhShomoysuchi.image(
              height: 50,
            ),
            text: Styled.text("ঔষধের সময়সুচি")
                .fontSize(10)
                .fontWeight(FontWeight.w500),
            onPressed: () {
              context.push("/medicine/${batch.id}");
            },
          ),
          CreateGridItem(
            image: Assets.images.kroyOntorvhukti.image(
              height: 50,
            ),
            text: Styled.text("ক্রয় ও অন্তর্ভুক্তি")
                .fontSize(10)
                .fontWeight(FontWeight.w500),
            onPressed: () {
              DialogHelper.showComingSoonDialog(context);
            },
          ),
          CreateGridItem(
            image: Assets.images.folafolMullayon.image(
              height: 50,
            ),
            text: Styled.text("ফলাফল মূল্যায়ন")
                .fontSize(10)
                .fontWeight(FontWeight.w500),
            onPressed: () {
              DialogHelper.showComingSoonDialog(context);
            },
          ),
          CreateGridItem(
            image: Assets.images.khabarerMojud.image(
              height: 50,
            ),
            text: Styled.text("খামারের মজুদ")
                .fontSize(10)
                .fontWeight(FontWeight.w500),
            onPressed: () {
              DialogHelper.showComingSoonDialog(context);
            },
          ),
          CreateGridItem(
            image: Assets.images.batchAccount.image(
              height: 50,
            ),
            text: Styled.text("ব্যাচ একাউন্ট")
                .fontSize(10)
                .fontWeight(FontWeight.w500),
            onPressed: () {
              DialogHelper.showComingSoonDialog(context);
            },
          ),
          CreateGridItem(
            image: Assets.images.bikroyKorun.image(
              height: 50,
            ),
            text: Styled.text("বিক্রয় করুন")
                .fontSize(10)
                .fontWeight(FontWeight.w500),
            onPressed: () {
              DialogHelper.showComingSoonDialog(context);
            },
          ),
          CreateGridItem(
            image: Assets.images.bikroykariTottho.image(
              height: 50,
            ),
            text: Styled.text("বিক্রয়কারী তথ্য")
                .fontSize(10)
                .fontWeight(FontWeight.w500),
            onPressed: () {
              DialogHelper.showComingSoonDialog(context);
            },
          ),
          CreateGridItem(
            image: Assets.images.dimSongroho.image(),
            text: Styled.text("ডিম সংগ্রহ")
                .fontSize(10)
                .fontWeight(FontWeight.w500),
            onPressed: () {},
          ),
        ].grid(
          primary: true,
          shrinkWrap: true,
        ),

        Styled.icon(Icons.arrow_upward)
            .decorated(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(10),
            )
            .gestures(
              onTap: onTap,
            ),
      ],
    ).card(color: Colors.white);
  }
}
