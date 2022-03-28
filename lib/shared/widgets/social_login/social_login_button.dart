import 'dart:ui';

import 'package:flutter/material.dart';

import '../../themes/app_colors.dart';
import '../../themes/app_images.dart';
import '../../themes/app_text_styles.dart';

class SocialLoginButton extends StatelessWidget {
  final VoidCallback onTap;

  const SocialLoginButton({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 56,
        decoration: BoxDecoration(
            color: AppColors.shape,
            borderRadius: BorderRadius.circular(5),
            border: Border.fromBorderSide(BorderSide(color: AppColors.stroke))),
        child: Row(
          children: [
            Expanded(flex: 1, child: Image.asset(AppImages.google)),
            Container(height: 56, width: 1, color: AppColors.stroke),
            Expanded(
              flex: 4,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Entrar com Google', style: TextStyles.buttonGray)
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}