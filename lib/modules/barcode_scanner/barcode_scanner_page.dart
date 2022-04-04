import 'package:flutter/material.dart';

import '../../shared/themes/app_colors.dart';
import '../../shared/themes/app_text_styles.dart';
import '../../shared/widgets/bottom_sheet/bottom_sheet_widget.dart';
import '../../shared/widgets/set_label_button/set_label_button.dart';
import 'barcode_scanner_controller.dart';
import 'barcode_scanner_status.dart';

class BarcodeScannerPage extends StatefulWidget {
  const BarcodeScannerPage({Key? key}) : super(key: key);

  @override
  State<BarcodeScannerPage> createState() => _BarcodeScannerPageState();
}

class _BarcodeScannerPageState extends State<BarcodeScannerPage> {
  final controller = BarcodeScannerController();

  @override
  void initState() {
    controller.getAvailableCameras();
    controller.statusNotifier.addListener(() {
      if (controller.status.hasBarcode) {
        Navigator.pushReplacementNamed(context, "/insert_boleto");
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          ValueListenableBuilder<BarcodeScannerStatus>(
            valueListenable: controller.statusNotifier,
            builder: (_, status, __) {
              if (status.showCamera) {
                return Container(
                  child: status.cameraController!.buildPreview(),
                );
              } else {
                return Container();
              }
            },
          ),
          RotatedBox(
            quarterTurns: 1,
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                backgroundColor: Colors.black,
                title: Text(
                  "Escaneie o código de barras do boleto",
                  style: TextStyles.buttonBackground,
                ),
                centerTitle: true,
                leading: BackButton(color: AppColors.background),
              ),
              body: Column(
                children: [
                  Expanded(
                      child: Container(
                    color: Colors.black,
                  )),
                  Expanded(
                      flex: 2,
                      child: Container(
                        color: Colors.transparent,
                      )),
                  Expanded(
                      child: Container(
                    color: Colors.black,
                  )),
                ],
              ),
              bottomNavigationBar: SetLabelButtons(
                primaryLabel: "Inserir código do boleto",
                primaryOnPressed: () {},
                secondaryLabel: "Adicionar da galeria",
                secondaryOnPressed: () {},
              ),
            ),
          ),
          ValueListenableBuilder<BarcodeScannerStatus>(
              valueListenable: controller.statusNotifier,
              builder: (_, status, __) {
                if (status.hasError) {
                  return BottomSheetWidget(
                    title: "Não foi possível identificar um código de barras.",
                    subtitle:
                        "Tente escanear novamente ou digite o código do seu boleto.",
                    primaryLabel: "Escanear Novamente",
                    primaryOnPressed: () {
                      controller.getAvailableCameras();
                    },
                    secondaryLabel: "Digitar código",
                    secondaryOnPressed: () {},
                  );
                } else {
                  return Container();
                }
              })
        ],
      ),
    );
  }
}
