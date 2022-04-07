import 'package:flutter/material.dart';

import '../../themes/app_colors.dart';

class DividerVerticalWidgetTwo extends StatelessWidget {
  const DividerVerticalWidgetTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(width: 1, height: 32, color: AppColors.stroke);
  }
}
