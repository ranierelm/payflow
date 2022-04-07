import 'package:flutter/material.dart';

import '../../themes/app_colors.dart';
import '../../themes/app_images.dart';
import '../../themes/app_text_styles.dart';
import '../divider_vertical/divider_vertical_widget_32.dart';

class BoletoInfoWidget extends StatelessWidget {
  final int size;
  const BoletoInfoWidget({
    Key? key,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            AppImages.logomini,
            width: 56,
            height: 34.22,
            color: AppColors.background,
          ),
          const Padding(
            padding: EdgeInsets.all(24),
            child: DividerVerticalWidgetTwo(),
          ),
          Text.rich(TextSpan(
            text: "Você tem ",
            style: TextStyles.captionBackground,
            children: [
              TextSpan(
                text: "$size boleto(s)\n",
                style: TextStyles.captionBoldBackground,
              ),
              TextSpan(
                text: "cadastrados para pagar",
                style: TextStyles.captionBackground,
              ),
            ],
          ))
        ],
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5), color: AppColors.secondary),
    );
  }
}
