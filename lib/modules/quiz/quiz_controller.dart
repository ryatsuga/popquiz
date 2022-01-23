import 'package:popquiz/shared/models/quiz_model.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class QuizController {
  Future<QuizModel> fetchQuizData() async {
    final url =
        Uri.https('my-json-server.typicode.com', '/ryatsuga/popquiz/db');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      return QuizModel.fromMap(jsonResponse['questionario']);
    } else {
      throw Exception('Failed to load quiz');
    }
  }

  Future<void> saveAnsweredQuiz(QuizModel quiz) async {
    final instance = await SharedPreferences.getInstance();
    // await instance.clear();
    if (instance.containsKey("quizzes")) {
      final json = instance.get("quizzes") as String;
      // print('Aqui agora: $json');
      List<dynamic> quizzes = convert.jsonDecode(json);
      quizzes.add(quiz.toMap());
      print('Poxa! ${quizzes}');
      await instance.setString("quizzes", convert.jsonEncode(quizzes));
      return;
    }
    print('Aqui: ${quiz.questions[1].answer}');
    await instance.setString("quizzes", '${[quiz.toJSON()]}');
    return;
  }
}
