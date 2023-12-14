import 'package:flutter/material.dart';

class StyledText extends StatelessWidget {
  // initialization work - Constructor
  const StyledText(this.text, {super.key});

  final String text;

  @override
  Widget build(context) {
    return Text(
      text,
      style: const TextStyle(
        color: Color.fromARGB(255, 237, 223, 252),
        fontSize: 24,
      ),
    );
  }
}
