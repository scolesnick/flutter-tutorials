import 'package:flutter/material.dart';
import 'package:adv_basics/answer_button.dart';
import 'package:adv_basics/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({
    super.key,
    required this.onSelectAnswer,
  });

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  final colorList = [
    const Color.fromARGB(255, 100, 181, 246),
    const Color.fromARGB(255, 22, 90, 145),
  ];
  var currentQuestionIndex = 0;

  void answerQuestion(String onSelectAnswer) {
    widget.onSelectAnswer(onSelectAnswer);
    // currentQuestionIndex = currentQuestionIndex + 1;
    // currentQuestionIndex += 1;
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestions = questions[currentQuestionIndex];

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colorList,
          begin: AlignmentDirectional.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: SizedBox(
        width: double.infinity,
        child: Container(
          margin: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                currentQuestions.text,
                style: GoogleFonts.lato(
                    color: const Color.fromARGB(255, 252, 244, 232),
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              ...currentQuestions.getShuffledAnswers().map(
                (ans) {
                  return AnswerButton(
                    ans,
                    () {
                      answerQuestion(ans);
                    },
                  );
                },
              ), // Populate each answer button dynamically
              // AnswerButton(currentQuestions.answers[0], () {}),
              // AnswerButton(currentQuestions.answers[1], () {}),
              // AnswerButton(currentQuestions.answers[2], () {}),
              // AnswerButton(currentQuestions.answers[3], () {}),
            ],
          ),
        ),
      ),
    );
  }
}
