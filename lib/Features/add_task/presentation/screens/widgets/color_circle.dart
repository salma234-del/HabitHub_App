import 'package:flutter/material.dart';
import 'package:todo/Core/utils/global/theme/app_color/app_color.dart';

class ColorCircle extends StatelessWidget {
  const ColorCircle({
    required this.color,
    super.key,
  });
  final Color color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: CircleAvatar(
        radius: 16,
        backgroundColor: AppColor.whiteColor,
        child: CircleAvatar(
          backgroundColor: color,
          radius: 13,
        ),
      ),
    );
  }
}
