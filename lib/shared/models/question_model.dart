class QuestionModel {
  final int id;
  final String title;
  final String description;
  final String? answer;

  QuestionModel(
      {required this.id,
      required this.title,
      required this.description,
      this.answer});
}
