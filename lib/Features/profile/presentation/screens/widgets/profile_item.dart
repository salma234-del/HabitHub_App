import 'package:flutter/material.dart';
import 'package:todo/Core/utils/global/theme/app_color/app_color.dart';
import 'package:todo/Core/utils/text_styles.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem({
    required this.title,
    required this.onTap,
    super.key,
  });
  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColor.backgroundColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: AppTextStyles.text14_700,
            ),
            const Text(
              '>',
              style: AppTextStyles.text14_700,
            )
          ],
        ),
      ),
    );
  }
}
