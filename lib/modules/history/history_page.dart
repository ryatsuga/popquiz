import 'package:flutter/material.dart';
import 'package:popquiz/modules/answered_quiz/answered_quiz_page.dart';
import 'package:popquiz/modules/history/history_controller.dart';
import 'package:popquiz/shared/models/quiz_model.dart';
import 'package:popquiz/shared/themes/app_colors.dart';
import 'package:popquiz/shared/themes/app_text_styles.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final controller = HistoryController();
  late Future<List<QuizModel>?> history;

  @override
  void initState() {
    history = controller.getQuizzesHistory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: Center(
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                padding: EdgeInsets.only(top: 16),
                color: AppColors.background,
                child: Text(
                  'Histórico de quizzes',
                  style: TextStyles.titleListTile,
                  textAlign: TextAlign.center,
                ))),
      ),
      body: Container(
          color: AppColors.background,
          child: FutureBuilder<List<QuizModel>?>(
            future: history,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                // return Container(
                //   child: Text('${snapshot.data!.title}'),
                // );
                return Container(
                  color: AppColors.background,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return MaterialButton(
                        onPressed: (() {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => AnsweredQuizPage(
                                  quiz: snapshot.data![index])));
                        }),
                        child: Card(
                          child: ListTile(
                            leading: Icon(Icons.notes),
                            title: Text('Quiz: ${snapshot.data![index].title}'),
                          ),
                        ),
                      );
                    },
                  ),
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return Center(child: const CircularProgressIndicator());
            },
          )),
    );
  }
}
