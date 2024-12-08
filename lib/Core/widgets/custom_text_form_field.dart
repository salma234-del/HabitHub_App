import 'package:flutter/material.dart';
import 'package:todo/Core/utils/functions/empty_validator.dart';
import 'package:todo/Core/utils/global/theme/app_color/app_color.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    required this.hintText,
    required this.controller,
    this.readOnly = false,
    this.onTap,
    super.key,
  });
  final String hintText;
  final TextEditingController controller;
  final bool readOnly;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 21,
            vertical: 28,
          ),
          decoration: BoxDecoration(
            color: AppColor.textFormFieldBg,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 21,
          ),
          child: TextFormField(
            controller: controller,
            validator: emptyValidator,
            decoration: InputDecoration(
              isDense: true,
              hintText: hintText,
            ),
            readOnly: readOnly,
            onTap: onTap,
          ),
        ),
      ],
    );
  }
}
