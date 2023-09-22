import 'package:flutter/material.dart';
import 'package:quizapp/questions_screen.dart';
import 'package:quizapp/start_screen.dart';
import 'package:quizapp/data/questions.dart';
import 'package:quizapp/results_screen.dart';


class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = []; // initially the list will be empty
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'question-screen';
    });
  }

  void chooseAnswer(String answer){
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
        setState(() {
          activeScreen = 'results-screen';
        });
      }
  }
  void back() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'question-screen';
    });
  }

  @override
  Widget build(context){
    Widget screenWidget = StartScreen(switchScreen);

    if(activeScreen == 'question-screen'){
      screenWidget = QuestionsScreen(onSelectAnswer: chooseAnswer,);
    }
    if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(chosenAnswer: selectedAnswers,restart: back,);
    }
    return MaterialApp(
          home: Scaffold(
            body: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.deepPurple, Colors.purple],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  )
              ),
              child: screenWidget,
            ),
          )
      );
  }
}