import 'package:flutter/material.dart';
import 'package:poulty_manager/feature/batch/presentation/functions/utils.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../../config/constant/constant.dart';
import '../../../../config/theme/color.dart';
import '../../../../core/Layout/extension.dart';

class KormiProfileScreen extends StatelessWidget {
  const KormiProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return [
      SizedBox(
        height: MediaQuery.of(context).size.height,
        child: [
          [
            Styled.icon(Icons.arrow_back).gestures(onTap: () {
              Navigator.pop(context);
            }),
            const Spacer(),
            Styled.icon(Icons.edit).gestures(onTap: () {}),
          ].toRow(),
          KSized.h12,
          [
            ClipOval(
              child: Image.network(
                'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?q=80&w=2787&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                width: 100,
                height: 100,
                fit: BoxFit.fill,
              ),
            ),
            KSized.h8,
            [
              Styled.text('মোঃ মাছুদ পারভেজ')
                  .fontSize(18)
                  .textColor(Colors.black),
              KSized.w4,
              Styled.text('(মিন্টু)').fontSize(18).textColor(Colors.grey),
            ].toRow(mainAxisAlignment: MainAxisAlignment.center),
            KSized.h12,
            KSized.h12,
            contentBox(title: 'কর্মী আইডি', value: '01223344'),
            KSized.h8,
            contentBox(title: 'মোবাইল নাম্বার', value: '01700000000'),
            KSized.h8,
            contentBox(title: 'ঠিকানা', value: 'বাংলাদেশ, ঢাকা, মিরপুর'),
          ].toColumn(),
        ].toColumn(),
      ),

      // Delete button
      SizedBox(
        height: 45,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            side: const BorderSide(
              color: AppColors.dangerColor,
            ),
          ),
          child: [
            const Icon(
              Icons.delete_forever_outlined,
              color: AppColors.dangerColor,
            ),
            Styled.text('ডিলিট করুন')
                .textColor(AppColors.dangerColor)
                .fontSize(16)
                .padding(left: 10),
          ].toRow(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
          ),
        ),
      ),
    ]
        .toColumn()
        .padding(
          horizontal: 20,
        )
        .parent(page);
  }

  SizedBox contentBox({required String title, required String value}) {
    return SizedBox(
      height: 45,
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
                color: AppColors.white3Color,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Styled.text(title).padding(left: 10),
              ),
            ),
          ),
          const SizedBox(width: 1), // Divider
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                color: const Color(0XFFF3F4F6).withOpacity(0.5),
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Styled.text(value).padding(left: 10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
