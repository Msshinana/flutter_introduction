import 'dart:async';

import 'package:flutter/material.dart';

class RefreshIndicatorPage extends StatefulWidget {
  const RefreshIndicatorPage({Key? key}) : super(key: key);

  @override
  _RefreshIndicatorPageState createState() => _RefreshIndicatorPageState();
}

class _RefreshIndicatorPageState extends State<RefreshIndicatorPage> {
  final _controller = ScrollController();

  Future _refresh() {
    final completer = Completer();
    Future.delayed(const Duration(seconds: 2), () {
      completer.complete();
    });
    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    final items = List.generate(100, (i) => i + 1).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Refresh Indicator'),
      ),
      body: RefreshIndicator(
        child: ListView.builder(
          controller: _controller,
          itemCount: items.length,
          itemBuilder: (context, index) => ListTile(
            title: Text('Item ${items[index]}'),
          ),
        ),
        onRefresh: _refresh,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _controller.animateTo(
          0,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        ),
        child: const Icon(
          Icons.arrow_upward,
          color: Colors.white,
        ),
      ),
    );
  }
}
