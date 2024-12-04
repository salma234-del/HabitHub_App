import 'package:flutter/material.dart';
import 'package:todo/Core/utils/icons.dart';
import 'package:todo/Core/widgets/socail_icon.dart';

class SocialLogin extends StatelessWidget {
  const SocialLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SocialIcon(
          iconPath: faceBookIcon,
        ),
        SizedBox(width: 20),
        SocialIcon(
          iconPath: googleIcon,
        ),
        SizedBox(width: 20),
        SocialIcon(
          iconPath: appleIcon,
        ),
      ],
    );
  }
}
