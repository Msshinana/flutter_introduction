import 'package:flutter/material.dart';

class GridViewExtentPage extends StatelessWidget {
  const GridViewExtentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grid View Extent'),
      ),
      body: Center(
        child: _buildGridView(),
      ),
    );
  }

  Widget _buildGridView() {
    return GridView.extent(
      maxCrossAxisExtent: 150, //视图不超过150的限制下最大限度撑满
      padding: const EdgeInsets.all(4),
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      children: List.generate(
        30,
        (index) => Image.asset(
          'assets/middle-pic-${index + 1}.jpg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
