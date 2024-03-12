import 'package:flutter/material.dart';
import 'package:first_app_2/gradient_container.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Roll Dice App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Roll Dice App'),
        ),
        body: const GradientContainer(
          [
            Color.fromARGB(255, 0, 34, 255),
            Color.fromARGB(255, 171, 11, 11),
          ],
        ),
      ),
    );
  }
}
