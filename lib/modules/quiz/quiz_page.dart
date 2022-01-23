import 'package:flutter/material.dart';
import 'package:popquiz/modules/quiz/quiz_controller.dart';
import 'package:popquiz/shared/models/quiz_model.dart';
import 'package:popquiz/shared/themes/app_colors.dart';
import 'package:popquiz/shared/themes/app_text_styles.dart';
import 'package:popquiz/shared/widgets/set_label_buttons/set_label_buttons.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final controller = QuizController();
  late Future<QuizModel> futureQuiz;
  QuizModel? newQuiz;
  late final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    futureQuiz = controller.fetchQuizData().then((val) => newQuiz = val);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColors.primary,
          automaticallyImplyLeading: false,
          title: Text(
            'Quiz',
            style: TextStyles.titleBoldBackground,
          ),
        ),
        body: Container(
            color: AppColors.background,
            padding: EdgeInsets.only(left: 6, right: 6, top: 15),
            child: Center(
              child: FutureBuilder<QuizModel>(
                future: futureQuiz,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    // return Container(
                    //   child: Text('${snapshot.data!.title}'),
                    // );
                    return ListView.builder(
                      itemCount: snapshot.data!.questions.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                            minVerticalPadding: 12,
                            title: Text.rich(
                              TextSpan(
                                  text: snapshot.data!.questions[index].title,
                                  style: TextStyles.buttonBoldPrimary,
                                  children: [
                                    TextSpan(
                                        text:
                                            '\n${snapshot.data!.questions[index].description}',
                                        style: TextStyles.buttonPrimary)
                                  ]),
                            ),
                            subtitle: SizedBox(
                              child: TextFormField(
                                validator: (String? str) => str!.isEmpty
                                    ? 'Favor preencher resposta'
                                    : null,
                                decoration: InputDecoration(
                                    prefix: Text(
                                  'R: ',
                                  style: TextStyles.captionGray,
                                )),
                                onSaved: (String? val) {
                                  newQuiz!.questions[index].answer = val;
                                },
                              ),
                            ));
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }
                  return const CircularProgressIndicator();
                },
              ),
            )),
        bottomNavigationBar: SetLabelButtons(
          primaryLabel: 'Cancelar',
          secondaryLabel: 'Responder',
          primaryOnPressed: () {
            Navigator.pushNamed(context, '/home');
          },
          enableSecondaryColor: true,
          secondaryOnPressed: () {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();
              controller.saveAnsweredQuiz(newQuiz!);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                    backgroundColor: AppColors.primary,
                    content: Center(
                        child: Text(
                      'Salvando Quiz...',
                      style: TextStyle(fontFamily: 'Inter', fontSize: 18),
                    ))),
              );
              Future.delayed(Duration(seconds: 3)).then((value) =>
                  {Navigator.pushReplacementNamed(context, '/home')});
            }
          },
        ),
      ),
    );
  }
}
