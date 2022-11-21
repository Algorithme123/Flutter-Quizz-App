import 'package:flutter/material.dart';
import 'package:QuizzDaniel/widgets/custom_text.dart';
import 'package:QuizzDaniel/widgets/page_quizz.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              elevation: 10.0,
              child: Container(
                height: MediaQuery.of(context).size.width * 0.8,
                width: MediaQuery.of(context).size.width * 0.8,
                child: Image.asset(
                  "quizz assets/cover.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context){

                        return PageQuizz();
                  }));
                },
              style: TextButton.styleFrom(backgroundColor: Colors.blue),

                child: CustomText ("Commencer le QuiZZ",
                  factor: 1.5,
                  ),

                )
          ],
        ),
      ),
    );
  }
}
