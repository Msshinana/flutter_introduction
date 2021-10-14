import 'package:flutter/material.dart';

class TabBarNavigationPage extends StatelessWidget {
  const TabBarNavigationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TabBar Navigation'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => _TabBarPage(),
          )),
          child: const Text('Show Tabs'),
        ),
      ),
    );
  }
}

class _SwitchTabNotification extends Notification {
  final int tab;

  _SwitchTabNotification(this.tab);
}

class _TabBar extends StatelessWidget {
  static final tabs = [
    {
      'title': 'First',
      'icon': const Icon(Icons.home),
      'builder': (BuildContext context) => _FirstTabPage(),
    },
    {
      'title': 'Second',
      'icon': const Icon(Icons.add),
      'builder': (BuildContext context) => _SecondTabPage(),
    },
    {
      'title': 'Third',
      'icon': const Icon(Icons.account_circle),
      'builder': (BuildContext context) => _ThirdTabPage(),
    },
  ];

  final int currentIndex;

  const _TabBar({
    Key? key,
    this.currentIndex = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (tab) {
        _SwitchTabNotification(tab).dispatch(context);
      },
      items: tabs
          .map(
            (v) => BottomNavigationBarItem(
              icon: _getIcon(v),
              label: _getTitle(v),
            ),
          )
          .toList(),
    );
  }
}

Widget _getIcon(Map<String, Object> v) {
  Widget currentWidget = v['icon'] as Widget;
  return currentWidget;
}

String _getTitle(Map<String, Object> v) {
  String currentWidget = v['title'] as String;
  return currentWidget;
}

class _TabBarPage extends StatefulWidget {
  @override
  _TabBarPageState createState() => _TabBarPageState();
}

class _TabBarPageState extends State<_TabBarPage> {
  static final _navigatorKeys =
      _TabBar.tabs.map((v) => GlobalKey<NavigatorState>()).toList();

  var _tab = 0;

  bool _handleSwitchTabNotification(_SwitchTabNotification notification) {
    setState(() {
      _tab = notification.tab;
    });
    return true;
  }

  Future<bool> _onWillPop() async {
    final maybePop = await _navigatorKeys[_tab].currentState!.maybePop();
    return Future.value(!maybePop);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: NotificationListener<_SwitchTabNotification>(
        onNotification: _handleSwitchTabNotification,
        child: IndexedStack(
          index: _tab,
          children: _TabBar.tabs
              .asMap()
              .entries
              .map(
                (entry) => Navigator(
                  key: _navigatorKeys[entry.key],
                  onGenerateRoute: (settings) {
                    WidgetBuilder builder;
                    switch (settings.name) {
                      case '/':
                        builder = _getBuilder(entry);
                        break;
                      default:
                        throw Exception('Invalid route: ${settings.name}');
                    }
                    return MaterialPageRoute(
                      builder: builder,
                      settings: settings,
                    );
                  },
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

WidgetBuilder _getBuilder(MapEntry<int, Map<String, Object>> entry) {
  WidgetBuilder currentWidget = entry.value['builder'] as WidgetBuilder;
  return currentWidget;
}

class _FirstTabPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Tab'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(flex: 3),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => _BackPage(),
                )),
                child: const Text('Go'),
              ),
              ElevatedButton(
                onPressed: () =>
                    Navigator.of(context, rootNavigator: true).pop(),
                child: const Text('Back'),
              )
            ],
          ),
          const Spacer(),
          const Counter(),
          const Spacer(flex: 3),
        ],
      ),
      bottomNavigationBar: const _TabBar(currentIndex: 0),
    );
  }
}

class _SecondTabPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Tab'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(flex: 3),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => _BackPage(),
                )),
                child: const Text('Go'),
              ),
              ElevatedButton(
                onPressed: () =>
                    Navigator.of(context, rootNavigator: true).pop(),
                child: const Text('Back'),
              )
            ],
          ),
          const Spacer(),
          const Counter(),
          const Spacer(flex: 3),
        ],
      ),
      bottomNavigationBar: const _TabBar(currentIndex: 1),
    );
  }
}

class _ThirdTabPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Third Tab'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(flex: 3),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => _BackPage(),
                )),
                child: const Text('Go'),
              ),
              ElevatedButton(
                onPressed: () =>
                    Navigator.of(context, rootNavigator: true).pop(),
                child: const Text('Back'),
              )
            ],
          ),
          const Spacer(),
          const Counter(),
          const Spacer(flex: 3),
        ],
      ),
      bottomNavigationBar: const _TabBar(currentIndex: 2),
    );
  }
}

class _BackPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Back'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Back'),
        ),
      ),
    );
  }
}

class Counter extends StatefulWidget {
  const Counter({Key? key}) : super(key: key);

  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  var _num = 0;

  void _substract() {
    setState(() {
      _num -= 1;
    });
  }

  void _add() {
    setState(() {
      _num += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton(
          onPressed: _substract,
          child: const Text('-'),
        ),
        Text(_num.toString()),
        ElevatedButton(
          onPressed: _add,
          child: const Text('+'),
        ),
      ],
    );
  }
}
