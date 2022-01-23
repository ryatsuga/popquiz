import 'package:flutter/material.dart';
import 'package:popquiz/modules/about/about_page.dart';
import 'package:popquiz/modules/history/history_page.dart';
import 'package:popquiz/modules/home/home_controller.dart';
import 'package:popquiz/shared/themes/app_colors.dart';
import 'package:popquiz/shared/themes/app_text_styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();
  final pages = [HistoryPage(), AboutPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(152),
        child: Container(
          height: 152,
          color: AppColors.primary,
          child: Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Center(
              child: ListTile(
                title: Text.rich(TextSpan(
                    text: "Olá, ",
                    style: TextStyles.titleRegular,
                    children: [
                      TextSpan(
                          text: "Leandro",
                          style: TextStyles.titleBoldBackground)
                    ])),
                subtitle: Text(
                  "Já respondeu um quiz hoje?",
                  style: TextStyles.captionShape,
                ),
                trailing: Container(
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(
                      color: AppColors.background,
                      borderRadius: BorderRadius.circular(5)),
                  child: IconButton(
                    icon: Icon(
                      Icons.logout,
                      color: AppColors.primary,
                    ),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/landing');
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: pages[controller.currentPage],
      bottomNavigationBar: Container(
        color: AppColors.background,
        height: 90,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          IconButton(
            onPressed: () {
              controller.setPage(0);
              setState(() {});
            },
            icon: Icon(Icons.home),
            color: controller.currentPage == 0
                ? AppColors.primary
                : AppColors.gray,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/quiz');
            },
            child: Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(5)),
              child: Icon(
                Icons.create,
                color: AppColors.background,
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              controller.setPage(1);
              setState(() {});
            },
            icon: Icon(Icons.info_outline),
            color: controller.currentPage == 1
                ? AppColors.primary
                : AppColors.gray,
          )
        ]),
      ),
    );
  }
}
