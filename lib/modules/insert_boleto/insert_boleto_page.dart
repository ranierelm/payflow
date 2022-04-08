import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

import '../../shared/themes/app_colors.dart';
import '../../shared/themes/app_text_styles.dart';
import '../../shared/widgets/input_text/input_text_widget.dart';
import '../../shared/widgets/set_label_button/set_label_button.dart';
import 'insert_boleto_controller.dart';

class InsertBoletoPage extends StatefulWidget {
  final String? barcode;
  const InsertBoletoPage({Key? key, this.barcode}) : super(key: key);

  @override
  State<InsertBoletoPage> createState() => _InsertBoletoPageState();
}

class _InsertBoletoPageState extends State<InsertBoletoPage> {
  final controller = InsertBoletoController();

  final moneyInputTextController =
      MoneyMaskedTextController(leftSymbol: "R\$", decimalSeparator: ",");

  final dueDateInputTextController = MaskedTextController(mask: '00/00/0000');
  final barcodeInputTextController = TextEditingController();

  @override
  void initState() {
    if (widget.barcode != null) {
      barcodeInputTextController.text = widget.barcode!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: const BackButton(color: AppColors.input),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 93, vertical: 24),
              child: Text(
                "Preencha os dados do boleto",
                style: TextStyles.titleBoldHeading,
                textAlign: TextAlign.center,
              ),
            ),
            Form(
              key: controller.formKey,
              child: Column(
                children: [
                  InputTextWidget(
                    iconInput: Icons.description_outlined,
                    labelText: "Nome do boleto",
                    onChanged: (value) {
                      controller.onChanged(name: value);
                    },
                    validator: controller.validateName,
                  ),
                  InputTextWidget(
                    iconInput: FontAwesomeIcons.circleXmark,
                    labelText: "Vencimento",
                    onChanged: (value) {
                      controller.onChanged(dueDate: value);
                    },
                    controller: dueDateInputTextController,
                    validator: controller.validateDueDate,
                  ),
                  InputTextWidget(
                    iconInput: FontAwesomeIcons.wallet,
                    labelText: "Valor",
                    onChanged: (value) {
                      controller.onChanged(
                        value: moneyInputTextController.numberValue,
                      );
                    },
                    controller: moneyInputTextController,
                    validator: (__) => controller
                        .validateValue(moneyInputTextController.numberValue),
                  ),
                  InputTextWidget(
                    iconInput: FontAwesomeIcons.barcode,
                    labelText: "Código",
                    onChanged: (value) {
                      controller.onChanged(barcode: value);
                    },
                    controller: barcodeInputTextController,
                    validator: controller.validateCode,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: SetLabelButtons(
        primaryLabel: "Cancelar",
        primaryOnPressed: () {
          Navigator.pushReplacementNamed(context, "/home");
        },
        secondaryLabel: "Cadastrar",
        secondaryOnPressed: () async {
          await controller.cadastrarBoleto();

          // Navigator.pushReplacementNamed(context, "/home");
        },
        enableSecondaryColor: true,
      ),
    );
  }
}
