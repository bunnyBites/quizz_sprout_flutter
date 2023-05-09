import 'package:flutter/cupertino.dart';
import 'package:quizz_sprout_flutter/questionare.dart';

class QuestionBank {
  int _questionNumber = 0;

  final List<Questionare> _questionare = [
    Questionare('Some cats are actually allergic to humans', true),
    Questionare('You can lead a cow down stairs but not up stairs.', false),
    Questionare('Approximately one quarter of human bones are in the feet.', true),
    Questionare('A slug\'s blood is green.', true),
    Questionare('Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', true),
    Questionare('It is illegal to pee in the Ocean in Portugal.', true),
    Questionare(
        'No piece of square dry paper can be folded in half more than 7 times.',
        false),
    Questionare(
        'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        true),
    Questionare(
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        false),
    Questionare(
        'The total surface area of two human lungs is approximately 70 square metres.',
        true),
    Questionare('Google was originally called \"Backrub\".', true),
    Questionare(
        'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        true),
    Questionare(
        'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        true),
  ];

  void onReset() { _questionNumber = 0; }

  bool isCurrentQuestionLast() { return  _questionNumber == _questionare.length - 1; }

  void onNextQuestion() {
    if (_questionNumber < _questionare.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestionNameByQuestionNumber() {
    return _questionare[_questionNumber].questionName;
  }

  bool getCorrectAnswerByQuestionNumber() {
    return _questionare[_questionNumber].correctAnswer;
  }
}