import 'package:flutter/material.dart';

import '../../shared/themes/app_colors.dart';

class InsertBoletoPage extends StatelessWidget {
  const InsertBoletoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: const Text("Insert Boleto page"),
      leading: const BackButton(color: AppColors.background),
    ));
  }
}
