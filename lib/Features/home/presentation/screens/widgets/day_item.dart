import 'package:flutter/material.dart';
import 'package:todo/Core/utils/global/theme/app_color/app_color.dart';
import 'package:todo/Core/utils/text_styles.dart';

class DayItem extends StatelessWidget {
  const DayItem({
    required this.isActive,
    required this.date,
    required this.day,
    required this.onTap,
    super.key,
  });
  final bool isActive;
  final String day;
  final String date;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isActive ? AppColor.purbleColor : AppColor.unselectedDay,
          borderRadius: const BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              day,
              style: isActive
                  ? AppTextStyles.text12_700
                  : AppTextStyles.text12_500,
            ),
            const SizedBox(height: 6),
            CircleAvatar(
              radius: 15,
              backgroundColor: AppColor.backgroundColor,
              child: Text(
                date,
                style: isActive
                    ? AppTextStyles.text12_700
                    : AppTextStyles.text12_500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
