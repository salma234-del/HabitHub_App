import 'package:flutter/material.dart';
import 'package:todo/Core/utils/app_text.dart';
import 'package:todo/Core/utils/global/theme/app_color/app_color.dart';
import 'package:todo/Features/profile/presentation/screens/widgets/profile_item.dart';

class ProfileContent extends StatelessWidget {
  const ProfileContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: AppColor.pinkBg,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
          child: Column(
            children: [
              ProfileItem(
                title: AppText.account,
                onTap: () {},
              ),
              const SizedBox(height: 16),
              ProfileItem(
                title: AppText.logout,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
