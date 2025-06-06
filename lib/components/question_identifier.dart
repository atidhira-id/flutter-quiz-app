import 'package:flutter/material.dart';

class QuestionIdentifier extends StatelessWidget {
  const QuestionIdentifier(this.number, this.isRight, {super.key});

  final int number;
  final bool isRight;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: isRight ? Colors.blue : Colors.red,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        (number).toString(),
        style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
      ),
    );
  }
}
