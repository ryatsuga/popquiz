import 'dart:convert';
import 'package:popquiz/shared/models/quiz_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HistoryController {
  Future<List<QuizModel>?> getQuizzesHistory() async {
    final instance = await SharedPreferences.getInstance();
    if (instance.containsKey("quizzes")) {
      final json = instance.get("quizzes") as String;
      Iterable jsonDecoded = jsonDecode(json);
      List<QuizModel> quizzesHistory =
          List<QuizModel>.from(jsonDecoded.map((x) => QuizModel.fromMap(x)));
      return quizzesHistory;
    }
    return null;
  }
}
