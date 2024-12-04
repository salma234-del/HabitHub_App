import 'package:flutter/material.dart';
import 'package:todo/Core/utils/app_text.dart';
import 'package:todo/Core/utils/text_styles.dart';

class ORDivider extends StatelessWidget {
  const ORDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          const Expanded(
            child: Divider(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              AppText.or,
              style: AppTextStyles.bodyMedium
                  .copyWith(fontWeight: FontWeight.w900),
            ),
          ),
          const Expanded(
            child: Divider(),
          ),
        ],
      ),
    );
  }
}
