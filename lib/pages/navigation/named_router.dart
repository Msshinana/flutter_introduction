import 'package:flutter/material.dart';

class NamedRoutePage extends StatelessWidget {
  const NamedRoutePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Named Route'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.of(context).pushNamed('/back'),
          child: const Text('Go'),
        ),
      ),
    );
  }
}
