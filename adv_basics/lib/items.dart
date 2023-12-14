import 'package:flutter/material.dart';
import 'package:adv_basics/styled_text.dart';

class Items extends StatelessWidget {
  const Items(this.startQuiz, {super.key});

  final void Function() startQuiz;
  // void pressAction() {}

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/quiz-logo.png',
          width: 300,
          color: const Color.fromARGB(150, 255, 255, 255),
        ),
        const SizedBox(
          height: 80,
        ),
        const StyledText('Learn Flutter the fun way!'),
        const SizedBox(
          height: 30,
        ),
        OutlinedButton.icon(
          onPressed: startQuiz,
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white,
            // shape: const BeveledRectangleBorder(),
            // side: const BorderSide(
            //   color: Colors.black,
            //   width: .1,
            // ),
            // backgroundColor: Colors.black
          ),
          icon: const Icon(Icons.arrow_right_alt),
          label: const Text('Start Quiz'),
        ),
      ],
    );
  }
}
