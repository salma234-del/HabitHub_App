import 'package:flutter/material.dart';
import 'package:todo/Core/utils/global/theme/app_color/app_color.dart';
import 'package:todo/Core/utils/text_styles.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 20,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColor.pinkColor,
      ),
      child: const Text(
        '📖 Read',
        style: AppTextStyles.text14_400,
      ),
    );
  }
}
