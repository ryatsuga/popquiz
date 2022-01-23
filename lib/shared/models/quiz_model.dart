import 'dart:convert';
import 'package:popquiz/shared/models/question_model.dart';

class QuizModel {
  final int id;
  final String title;
  List<QuestionModel> questions;

  QuizModel({required this.id, required this.title, required this.questions});

  factory QuizModel.fromMap(Map<String, dynamic> map) {
    return QuizModel(
        id: map['id'],
        title: map['titulo'],
        questions: List<QuestionModel>.from(
            map['questoes'].map((x) => QuestionModel.fromMap(x))));
  }

  factory QuizModel.fromJson(String json) =>
      QuizModel.fromMap(jsonDecode(json));

  Map<String, dynamic> toMap() => {
        "id": id,
        "titulo": title,
        "questoes": List<dynamic>.from(questions.map((x) => x.toMap())),
      };

  String toJSON() => jsonEncode((toMap()));
}
