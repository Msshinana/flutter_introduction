import 'package:flutter/material.dart';

class ContainerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var conatiner = Container(
      decoration: const BoxDecoration(
        color: Colors.black26,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              _buildItem('small-pic-1'),
              _buildItem('small-pic-2'),
            ],
          ),
          Row(
            children: [
              _buildItem('small-pic-3'),
              _buildItem('small-pic-4'),
            ],
          )
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Conatiner'),
      ),
      body: conatiner,
    );
  }

  Widget _buildItem(String name) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 10, color: Colors.black38),
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        margin: const EdgeInsets.all(4),
        child: Image.asset(
          'assets/$name.jpg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
