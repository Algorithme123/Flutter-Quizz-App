import 'package:flutter/material.dart';
import 'package:quiz/widgets/custom_text.dart';

class PageQuizz extends StatefulWidget {
  const PageQuizz({Key? key}) : super(key: key);

  @override
  State<PageQuizz> createState() => _PageQuizzState();
}

class _PageQuizzState extends State<PageQuizz> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText("Le Quizz"),
      ),
      body: Center(),
    );
  }
}
