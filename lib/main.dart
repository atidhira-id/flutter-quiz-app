import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 9, 40, 70),
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('assets/images/quiz-logo.png', width: 300),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    'Learn Flutter in a Fun Way!',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
                OutlinedButton(
                  onPressed: () {},
                  child: Text(
                    'Start Quiz',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
