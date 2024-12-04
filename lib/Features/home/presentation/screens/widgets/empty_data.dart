import 'package:flutter/material.dart';
import 'package:todo/Core/utils/app_text.dart';
import 'package:todo/Core/utils/icons.dart';
import 'package:todo/Core/utils/text_styles.dart';

class EmptyData extends StatelessWidget {
  const EmptyData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(homeNoData),
        const SizedBox(height: 24),
        const Text(
          AppText.nothing,
          style: AppTextStyles.text16_500,
        ),
      ],
    );
  }
}
