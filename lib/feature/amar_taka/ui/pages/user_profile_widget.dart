import 'package:flutter/material.dart';
import 'package:poulty_manager/config/config.dart';
import 'package:styled_widget/styled_widget.dart';

class UserProfileWidget extends StatelessWidget {
  final String userName;
  final String userId;
  final VoidCallback onProfileTap;
  final String profileImagePath; // Add this line

  const UserProfileWidget({
    Key? key,
    required this.userName,
    required this.userId,
    required this.onProfileTap,
    required this.profileImagePath, // Add this line
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.dividerColor, width: 1.5),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: Colors.grey,
              child: profileImagePath.isNotEmpty
                  ? ClipOval(
                      child: Image.network(
                        profileImagePath,
                        width: 50,
                        height: 50,
                        fit: BoxFit.fill,
                      ),
                    )
                  : const Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 40,
                    ),
            ),
            const SizedBox(width: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Styled.text(userName).fontSize(18).textColor(Colors.black),
                Styled.text('ID: $userId')
                    .fontSize(14)
                    .textColor(AppColors.primaryColor),
              ],
            ),
            const Spacer(),
            GestureDetector(
              onTap: onProfileTap,
              child: const CircleAvatar(
                radius: 15,
                backgroundColor: AppColors.dividerColor,
                child: Icon(
                  Icons.arrow_forward,
                  color: Color(0XFF949CAD),
                  size: 15,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
