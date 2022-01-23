import 'package:flutter/material.dart';
import 'package:popquiz/shared/models/quiz_model.dart';
import 'package:popquiz/shared/themes/app_colors.dart';
import 'package:popquiz/shared/themes/app_text_styles.dart';
import 'package:popquiz/shared/widgets/set_label_buttons/set_label_buttons.dart';

class AnsweredQuizPage extends StatelessWidget {
  final QuizModel quiz;

  const AnsweredQuizPage({Key? key, required this.quiz}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.primary,
        automaticallyImplyLeading: false,
        title: ListTile(
          title: Text(
            'Detalhes',
            style: TextStyles.titleBoldBackground,
            textAlign: TextAlign.center,
          ),
          subtitle: Text(
            'Quiz ${quiz.title}',
            style: TextStyles.captionGray,
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: Center(
          child: ListView.builder(
              padding: EdgeInsets.only(top: 15),
              itemCount: quiz.questions.length,
              itemBuilder: ((context, index) {
                return ListTile(
                  title: Text.rich(
                    TextSpan(text: '${quiz.questions[index].title}', children: [
                      TextSpan(
                          text: '\n${quiz.questions[index].answer}',
                          style: TextStyles.captionGray)
                    ]),
                    style: TextStyles.titleListTile,
                    textAlign: TextAlign.center,
                  ),
                );
              }))),
      bottomNavigationBar: SetLabelButtons(
          primaryLabel: 'Voltar',
          secondaryLabel: 'Remover',
          primaryOnPressed: () {
            Navigator.pushNamed(context, '/home');
          },
          enableSecandaryDangerColor: true,
          secondaryOnPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                  backgroundColor: AppColors.primary,
                  content: Center(
                      child: Text(
                    'Não funciona hahaha...',
                    style: TextStyle(fontFamily: 'Inter', fontSize: 18),
                  ))),
            );

            Navigator.pushReplacementNamed(context, '/home');
          }),
    );
  }
}
