import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/questions_screen.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/gradient_container.dart';
import 'package:adv_basics/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';
  final colorList = const [
    Color.fromARGB(255, 52, 20, 108),
    Color.fromARGB(255, 100, 56, 176),
  ];

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  void restartQuiz() {
    selectedAnswers = [];

    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  // Widget? activeScreen;

  // @override
  // void initState() {
  // activeScreen = GradientContainer(
  //   const [
  //     Color.fromARGB(255, 52, 20, 108),
  //     Color.fromARGB(255, 100, 56, 176),
  //   ],
  //   switchScreen,
  // );
  //   super.initState();
  // }

  // void switchScreen() {
  //   setState(() {
  //     activeScreen = const QuestionsScreen();
  //   });
  // }

  @override
  Widget build(context) {
    // Ternnary Expression
    // final screenWidget = activeScreen == 'start-screen'
    //     ? GradientContainer(colorList, switchScreen)
    //     : const QuestionsScreen();

    // If statement doing the same as above
    Widget screenWidget = GradientContainer(colorList, switchScreen);
    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(
        onSelectAnswer: chooseAnswer,
      );
    }

    if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(
        chosenAnswers: selectedAnswers,
        restartFunc: restartQuiz,
      );
    }

    return MaterialApp(
      home: Scaffold(
        // body: activeScreen,
        body: screenWidget,
      ),
    );
  }
}
