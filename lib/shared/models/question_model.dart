import 'dart:convert';

class QuestionModel {
  final int id;
  final String title;
  final String description;
  String? answer;

  QuestionModel(
      {required this.id,
      required this.title,
      required this.description,
      this.answer});

  factory QuestionModel.fromMap(Map<String, dynamic> map) {
    return QuestionModel(
        id: map['id'],
        title: map['titulo'],
        description: map['descricao'],
        answer: map['resposta']);
  }

  factory QuestionModel.fromJson(String json) =>
      QuestionModel.fromMap(jsonDecode(json));

  Map<String, dynamic> toMap() =>
      {"id": id, "titulo": title, "descricao": description, "resposta": answer};

  String toJSON() => jsonEncode((toMap()));
}
