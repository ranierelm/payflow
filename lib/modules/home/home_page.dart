import 'package:flutter/material.dart';

import '../../shared/themes/app_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("Home Page"),
            backgroundColor: AppColors.primary));
  }
}
