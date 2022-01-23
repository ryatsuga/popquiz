import 'dart:convert';

import 'package:popquiz/shared/models/question_model.dart';

class QuizModel {
  final int id;
  final String title;
  List<QuestionModel> questions;

  QuizModel({required this.id, required this.title, required this.questions});

  factory QuizModel.fromMap(Map<String, dynamic> map) {
    return QuizModel(
        id: map['nome'], title: map['titulo'], questions: map['questoes']);
  }

  factory QuizModel.fromJson(String json) =>
      QuizModel.fromMap(jsonDecode(json));

  Map<String, dynamic> toMap() => {
        "id": id,
        "titulo": title,
        "questoes": questions,
      };

  String toJSON() => jsonEncode((toMap()));
}
