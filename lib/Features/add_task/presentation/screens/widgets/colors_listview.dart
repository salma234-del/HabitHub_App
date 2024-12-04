import 'package:flutter/material.dart';
import 'package:todo/Core/utils/global/theme/app_color/app_color.dart';
import 'package:todo/Features/add_task/presentation/screens/widgets/color_circle.dart';

class ColorsListView extends StatelessWidget {
  const ColorsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => ColorCircle(
          color: AppColor.cardColors[index],
        ),
        separatorBuilder: (context, index) => const Padding(
          padding: EdgeInsetsDirectional.only(end: 16),
        ),
        itemCount: AppColor.cardColors.length,
      ),
    );
  }
}
