import 'package:flutter/material.dart';

import '../../shared/themes/app_colors.dart';
import '../../shared/themes/app_text_styles.dart';
import '../extract/extract_page.dart';
import '../meus_boletos/meus_boletos_page.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeController = HomeController();
  final pages = [
    const MeusBoletosPage(),
    const ExtractPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(152),
        child: Container(
          height: 152,
          color: AppColors.primary,
          child: Center(
            child: ListTile(
              title: Text.rich(TextSpan(
                  text: "Olá, ",
                  style: TextStyles.titleRegular,
                  children: [
                    TextSpan(
                        text: "Raniere", style: TextStyles.titleBoldBackground)
                  ])),
              subtitle: Text("Mantenha suas contas em dia",
                  style: TextStyles.captionShape),
              trailing: Container(
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(5))),
            ),
          ),
        ),
      ),
      body: pages[homeController.currentPage],
      bottomNavigationBar: SizedBox(
          height: 90,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: () {
                    homeController.setPage(0);
                    setState(() {});
                  },
                  icon: Icon(
                    Icons.home,
                    color: homeController.currentPage == 0
                        ? AppColors.primary
                        : AppColors.body,
                  )),
              GestureDetector(
                child: Container(
                  height: 56,
                  width: 56,
                  decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(5)),
                  child: IconButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, "/barcode_scanner");
                      },
                      icon: const Icon(Icons.add_box_outlined,
                          color: AppColors.background)),
                ),
              ),
              IconButton(
                  onPressed: () {
                    homeController.setPage(1);
                    setState(() {});
                  },
                  icon: Icon(
                    Icons.description_outlined,
                    color: homeController.currentPage == 1
                        ? AppColors.primary
                        : AppColors.body,
                  )),
            ],
          )),
    );
  }
}
