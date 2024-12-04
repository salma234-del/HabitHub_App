import 'package:flutter/material.dart';
import 'package:todo/Core/utils/global/theme/app_color/app_color.dart';

class CloseIcon extends StatelessWidget {
  const CloseIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.topEnd,
      child: CircleAvatar(
        radius: 30,
        backgroundColor: AppColor.backgroundColor,
        child: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}
