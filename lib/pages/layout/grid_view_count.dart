import 'package:flutter/material.dart';

class GridViewCountPage extends StatelessWidget {
  const GridViewCountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gride View Count'),
      ),
      body: Center(
        child: _buildGridView(context),
      ),
    );
  }

  Widget _buildGridView(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return GridView.count(
      //横轴方向可容纳的数量
      crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3,
      padding: const EdgeInsets.all(4),
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      //纵横比
      childAspectRatio: (orientation == Orientation.portrait) ? 1 : 1.3,
      children: List.generate(
        30,
        (index) => GridTile(
          child: Image.asset(
            'assets/middle-pic-${index + 1}.jpg',
            fit: BoxFit.cover,
          ),
          footer: GridTileBar(
            backgroundColor: Colors.black45,
            title: Text('Picture ${index + 1}'),
            subtitle: Text('Description of ${index + 1}'),
            trailing: const Icon(
              Icons.star_border,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
