import 'package:flutter/material.dart';
import 'package:movies_app/AddMovie.dart';
import 'package:movies_app/Home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies',
      home: Home(),
      routes: {
        "addMovie": (context) => AddMovie()
      },
    );
  }
}
