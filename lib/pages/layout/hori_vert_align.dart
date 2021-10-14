import 'package:flutter/material.dart';

class HoriVertAlignPage extends StatelessWidget {
  const HoriVertAlignPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Horizontal and Vertical Align'),
      ),
      body: Center(
          child: ListView(
        children: [
          Column(
            children: [
              const Text('mainAxisAlignment: MainAxisAlignment.start'),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset('assets/small-pic-1.jpg'),
                  Image.asset('assets/small-pic-2.jpg'),
                  Image.asset('assets/small-pic-3.jpg'),
                ],
              ),
            ],
          ),
          Column(
            children: [
              const Text('mainAxisAlignment: MainAxisAlignment.end'),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset('assets/small-pic-1.jpg'),
                  Image.asset('assets/small-pic-2.jpg'),
                  Image.asset('assets/small-pic-3.jpg'),
                ],
              ),
            ],
          ),
          Column(
            children: [
              const Text('mainAxisAlignment: MainAxisAlignment.center'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/small-pic-1.jpg'),
                  Image.asset('assets/small-pic-2.jpg'),
                  Image.asset('assets/small-pic-3.jpg'),
                ],
              ),
            ],
          ),
          Column(
            children: [
              const Text('mainAxisAlignment: MainAxisAlignment.spaceAround'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset('assets/small-pic-1.jpg'),
                  Image.asset('assets/small-pic-2.jpg'),
                  Image.asset('assets/small-pic-3.jpg'),
                ],
              ),
            ],
          ),
          Column(
            children: [
              const Text('mainAxisAlignment: MainAxisAlignment.spaceBetween'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/small-pic-1.jpg'),
                  Image.asset('assets/small-pic-2.jpg'),
                  Image.asset('assets/small-pic-3.jpg'),
                ],
              ),
            ],
          ),
          Column(
            children: [
              const Text('mainAxisAlignment: MainAxisAlignment.spaceEvenly'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset('assets/small-pic-1.jpg'),
                  Image.asset('assets/small-pic-2.jpg'),
                  Image.asset('assets/small-pic-3.jpg'),
                ],
              ),
            ],
          ),
        ],
      )),
    );
  }
}
