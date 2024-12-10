import 'package:flutter/material.dart';
import 'package:todo/Core/utils/global/theme/app_color/app_color.dart';

class ColorCircle extends StatelessWidget {
  const ColorCircle({
    required this.color,
    this.isSelected = false,
    super.key,
  });
  final Color color;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 16,
      backgroundColor: isSelected ? AppColor.whiteColor : Colors.transparent,
      child: CircleAvatar(
        backgroundColor: color,
        radius: 13,
      ),
    );
  }
}
