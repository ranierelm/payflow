import 'package:flutter/material.dart';

import '../../themes/app_colors.dart';
import '../../themes/app_text_styles.dart';

class InputTextWidget extends StatelessWidget {
  final String labelText;
  final IconData iconInput;
  final String? initialValue;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final void Function(String value) onChanged;

  const InputTextWidget({
    Key? key,
    required this.labelText,
    required this.iconInput,
    this.initialValue,
    this.validator,
    this.controller,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TextFormField(
        controller: controller,
        onChanged: onChanged,
        initialValue: initialValue,
        validator: validator,
        style: TextStyles.input,
        decoration: InputDecoration(
          icon: Row(mainAxisSize: MainAxisSize.min, children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 0, 16, 0),
              child: Icon(iconInput, color: AppColors.primary),
            ),
            Container(
              width: 1,
              height: 48,
              color: AppColors.stroke,
            )
          ]),
          labelText: labelText,
          labelStyle: TextStyles.input,
          border: InputBorder.none,
        ),
      ),
      const Padding(
        padding: EdgeInsets.fromLTRB(24, 0, 24, 16),
        child: Divider(
          height: 1,
          thickness: 1,
          color: AppColors.stroke,
        ),
      )
    ]);
  }
}
