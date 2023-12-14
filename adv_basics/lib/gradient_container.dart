import 'package:flutter/material.dart';
import 'package:adv_basics/items.dart';

const beginAlign = Alignment.topLeft;
const endAlign = Alignment.bottomRight;

class GradientContainer extends StatelessWidget {
  // Constructor
  const GradientContainer(this.colorList, this.startQuiz, {super.key});

  final List<Color> colorList;
  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colorList,
          begin: beginAlign,
          end: endAlign,
        ),
      ),
      child: Center(
        child: Items(startQuiz),
      ),
    );
  }
}
