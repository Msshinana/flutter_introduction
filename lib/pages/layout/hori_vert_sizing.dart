import 'package:flutter/material.dart';

class HoriVertSizingPage extends StatelessWidget {
  const HoriVertSizingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Horizonal and Vertical Sizing'),
      ),
      body: Center(
        child: Row(
          children: [
            Expanded(
                child: Image.asset(
              'assets/small-pic-1.jpg',
              fit: BoxFit.cover,
            )),
            Expanded(
                flex: 2,
                child: Image.asset(
                  'assets/small-pic-1.jpg',
                  fit: BoxFit.cover,
                )),
            Expanded(
                child: Image.asset(
              'assets/small-pic-1.jpg',
              fit: BoxFit.cover,
            )),
          ],
        ),
      ),
    );
  }
}
