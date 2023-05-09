import 'package:flutter/material.dart';
import 'package:quizz_sprout_flutter/question_bank.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuestionBank questionBank = QuestionBank();
void main() => runApp(const Quizzler());

class Quizzler extends StatelessWidget {
  const Quizzler({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> iconList = [];

  void onReset() {}

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questionBank.getQuestionNameByQuestionNumber(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        choiceButton("True", Colors.green),
        choiceButton("False", Colors.red),
        Row(children: iconList)
      ],
    );
  }

  Expanded choiceButton(String buttonLabel, Color color) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: TextButton(
          style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(color)),
          child: Text(
            buttonLabel,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
          ),
          onPressed: () {
            // current question number
            if (questionBank.isCurrentQuestionLast()) {
              showAlert().show();
              return;
            }

            //The user picked true.
            setState(() {
              questionBank.onNextQuestion();
            });

            bool correctAnswer =
                questionBank.getCorrectAnswerByQuestionNumber();

            if (buttonLabel == "True" && correctAnswer) {
              setState(() {
                iconList.add(const Icon(
                  Icons.check,
                  color: Colors.green,
                ));
              });
            } else {
              setState(() {
                iconList.add(const Icon(
                  Icons.close,
                  color: Colors.red,
                ));
              });
            }
          },
        ),
      ),
    );
  }

  Alert showAlert() {
    void reset() {
      setState(() {
        questionBank.onReset();
        iconList.clear();
      });

      Navigator.pop(context);
    }

    return Alert(
        context: context,
        title: "Good Job!",
        desc: "You have completed the quiz",
        buttons: [
          DialogButton(
            onPressed: reset,
            width: 120,
            child: const Text(
              "Reset",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ],
        closeFunction: reset);
  }
}
