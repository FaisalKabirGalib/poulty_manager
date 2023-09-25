// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:styled_widget/styled_widget.dart';

import '/config/config.dart';
import '/feature/batch/presentation/widgets/two_text_column.dart';
import '/feature/home/fragment.dart';
import '/gen/assets.gen.dart';
import '/interface/image_text.dart';

class BatchHome extends StatelessWidget {
  const BatchHome({
    Key? key,
    required this.firmId,
  }) : super(key: key);
  final String firmId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Styled.text("ব্যাচ ম্যানেজমেন্ট")
            .textColor(Colors.white)
            .fontSize(18),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          ListView(
            children: [
              const SizedBox(
                height: 20,
              ),
              [
                const TwoTextColumn(uppertext: "নং", lowerText: "08"),
                const TwoTextColumn(
                    uppertext: "ব্যাচের নামঃ", lowerText: "সোনালী মুরগী"),
                const TwoTextColumn(
                    uppertext: "শুরুর তারিখ", lowerText: "১ জুন ২০২২"),
                const TwoTextColumn(uppertext: "ব্যাচ ID", lowerText: "54721"),
              ]
                  .toRow(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  )
                  .constrained(minHeight: 40, maxHeight: 60),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: 4,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 2.5,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10),
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: AppColors.primaryColor),
                      ),
                      child: [
                        const SizedBox(
                          width: 4,
                        ),
                        [
                          Styled.text("উৎপাদন ব্যায় (কেজি)").fontSize(10),
                          Styled.text("৪১৪.০২৪ টাক")
                              .fontSize(10)
                              .textColor(Colors.grey[500]),
                        ].toColumn(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center),
                        Assets.images.hen.image().expanded(),
                      ].toRow(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      ),
                    );
                  },
                ),
              ),
              secondGrid.grid(primary: false, shrinkWrap: true),
              [
                [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Styled.text("08"),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Styled.text("সোনালী মুরগী"),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Styled.text("১ জুন ২০২২"),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Styled.text("54721"),
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
              ].toColumn().padding(all: 6).card(color: Colors.white),
              const SizedBox(
                height: 20,
              ),
            ],

            // make a grid with show two item in a row with builder
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child: FloatingActionButton(
              onPressed: () {
                context.push("/firm/$firmId/batch/new");
              },
              child: const Icon(Icons.add),
            ),
          )
        ],
      ),
    );
  }
}
