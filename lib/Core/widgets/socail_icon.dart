import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo/Core/utils/global/theme/app_color/app_color.dart';

class SocialIcon extends StatelessWidget {
  const SocialIcon({
    required this.iconPath,
    super.key,
  });

  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        const CircleAvatar(
          radius: 25,
          backgroundColor: AppColor.whiteColor,
        ),
        SvgPicture.asset(
          iconPath,
        ),
      ],
    );
  }
}
