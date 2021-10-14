import 'package:flutter/material.dart';
import 'dart:ui';

class WidgetBasicPage extends StatelessWidget {
  const WidgetBasicPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          _appBar(
            title: Text(
              'Example Title',
              style: Theme.of(context).primaryTextTheme.headline6,
            ),
          ),
          const Expanded(
              child: Center(
            child: Text('hello, world!'),
          ))
        ],
      ),
    );
  }
}

class _appBar extends StatelessWidget {
  final Widget title;

  const _appBar({Key? key, required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQueryData.fromWindow(window).padding.top + 48,
      padding: EdgeInsets.symmetric(
        horizontal: 8,
        vertical: MediaQueryData.fromWindow(window).padding.top,
      ),
      decoration: const BoxDecoration(color: Colors.green),
      child: Row(
        children: [
          const IconButton(
            onPressed: null,
            icon: Icon(Icons.menu),
            tooltip: 'Navigation menu',
          ),
          Expanded(child: title),
          const IconButton(
            onPressed: null,
            icon: Icon(Icons.search),
            tooltip: 'search',
          )
        ],
      ),
    );
  }
}
