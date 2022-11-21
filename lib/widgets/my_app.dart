import 'package:flutter/material.dart';
import 'package:QuizzDaniel/widgets/home.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application de Quiz",
      theme: ThemeData (
        primarySwatch: Colors.lightBlue,
      ),
      home: MyHomePage(title: "Application Flutter"),
    );
  }
}
