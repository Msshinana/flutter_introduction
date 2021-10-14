import 'package:flutter/material.dart';
import 'package:flutter_introduction/pages/home.dart';
import 'package:flutter_introduction/pages/pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Introduction',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      routes: {
        '/back': (context) => const NextPage(),
      },
      home: const HomePage(),
    );
  }
}
