class Questionare {
  String questionName = "";
  bool correctAnswer = false;

  Questionare(String newQuestion, bool correctAnswerForTheQuestion) {
    questionName = newQuestion;
    correctAnswer = correctAnswerForTheQuestion;
  }
}