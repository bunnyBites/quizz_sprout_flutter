import 'dart:math';

import 'package:flutter/material.dart';

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
  List<String> quitionare = [
    'You can lead a cow down stairs but not up stairs.',
    'Approximately one quarter of human bones are in the feet.',
    "A slug's blood is green.",
  ];

  int currentStep = 0;

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
                quitionare[currentStep],
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

        //TODO: Add a Row here as your score keeper
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
            //The user picked true.
            if (currentStep > 2) return;

            setState(() {
              currentStep += 1;
            });

            if (buttonLabel == "True") {
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
}

/*
question1: , false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
