import 'package:flutter/material.dart';

class SliverAppBarScrollPage extends StatelessWidget {
  static final _tabs = ['Tab1', 'Tab2', 'Tab3'];

  const SliverAppBarScrollPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
          length: _tabs.length,
          child: _Body(
            tabs: _tabs,
          )),
    );
  }
}

class _Body extends StatefulWidget {
  final List<String> tabs;
  const _Body({
    Key? key,
    required this.tabs,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  final _scrollController = ScrollController();

  final _items = {
    'Tab1': <String>[],
    'Tab2': <String>[],
    'Tab3': <String>[],
  };

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(_scrollListener);
    _loadItems(widget.tabs[0]);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  void _scrollListener() {
    final index = DefaultTabController.of(context)!.index;
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      _loadItems(widget.tabs[index]);
    }
  }

  void _loadItems(String name) {
    setState(() {
      final start = _items[name]!.length;
      _items[name]!.addAll(List.generate(20, (i) => 'Item ${start + i}'));
    });
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
              _buildSliverAppBar(context, innerBoxIsScrolled),
            ],
        body: _buildTabBarView());
  }

  Widget _buildSliverAppBar(BuildContext context, bool innerBoxIsScrolled) {
    return SliverOverlapAbsorber(
      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
      sliver: SliverAppBar(
        expandedHeight: 240,
        forceElevated: innerBoxIsScrolled,
        flexibleSpace: Container(
          padding: const EdgeInsets.all(5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Spacer(flex: 5),
              Text(
                'Sliver App Bar',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(flex: 5),
              Text(
                'Intro',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                ),
              ),
              Spacer(flex: 5),
            ],
          ),
        ),
        bottom: TabBar(
          tabs: widget.tabs
              .map((String name) => Tab(
                    text: name,
                  ))
              .toList(),
        ),
      ),
    );
  }

  Widget _buildTabBarView() {
    return TabBarView(
        children: widget.tabs
            .map(
              (name) => SafeArea(
                child: Builder(
                  builder: (context) => CustomScrollView(
                    key: PageStorageKey<String>(name),
                    slivers: [
                      SliverOverlapInjector(
                        handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                            context),
                      ),
                      SliverList(
                          delegate: SliverChildBuilderDelegate(
                              (context, index) => ListTile(
                                    title: Text('$name Item $index'),
                                  ),
                              childCount: _items.length))
                    ],
                  ),
                ),
              ),
            )
            .toList());
  }
}
