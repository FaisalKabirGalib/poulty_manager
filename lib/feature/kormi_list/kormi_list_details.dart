import 'package:flutter/material.dart';
import 'kormi_profile_screen.dart';
import 'user_profile_widget.dart';
import '../amar_taka/ui/widgets/add_button.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../config/constant/constant.dart';
import '../../core/Layout/extension.dart';
import '../batch/presentation/functions/utils.dart';

class KormiListDetailsScreen extends StatelessWidget {
  const KormiListDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        [
          titleWithBackArrowAndAction(
            'কর্মী লিস্ট',
            'এই সেকশন আপনার ফার্মের টাকা জমা করতে পারবেন এবং টাকা উত্তোলন করতে পারবেন।',
            onBack: () {
              Navigator.pop(context);
            },
          ),
          KSized.h12,
          KSized.h4,
          UserProfileWidget(
            userName: 'শেখ মুজিবুর রহমান',
            userId: '01223344',
            onProfileTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const KormiProfileScreen();
              }));
            },
            profileImagePath:
                'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?q=80&w=2787&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          ),
        ].toColumn().padding(horizontal: 20).parent(page),
        Positioned(
          bottom: 20,
          right: 20,
          child: AddButton(onPressed: () {}),
        ),
      ],
    );
  }
}
