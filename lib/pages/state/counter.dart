import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StateCounterPage extends StatelessWidget {
  const StateCounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => _CounterModel(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Counter with Provider'),
        ),
        body: _Body(),
        floatingActionButton: _ActionButton(),
      ),
    );
  }
}

class _CounterModel with ChangeNotifier {
  int value = 0;

  void increment() {
    value += 1;
    notifyListeners();
  }
}

class _Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('You have pushed the button this many times:'),
          Consumer<_CounterModel>(
            builder: (context, counter, child) => Text(
              '${counter.value}',
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
        ],
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () =>
          Provider.of<_CounterModel>(context, listen: false).increment(),
      tooltip: 'Increment',
      child: const Icon(Icons.add),
    );
  }
}
