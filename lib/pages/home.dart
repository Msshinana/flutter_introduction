import 'package:flutter/material.dart';
import 'package:flutter_introduction/file/home_panel.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  void _resetPanels() {
    for (var panel in home_panels) {
      panel['isExpanded'] = false;
      for (var item in (panel['items'] as List)) {
        item['isSelected'] = false;
      }
    }
  }

  void _onExpand(index, isExpanded) {
    _resetPanels();

    home_panels[index]['isExpanded'] = !isExpanded;

    setState(() {});
  }

  void _onSelected(Map<String, Object> panel, Map<String, Object> item) {
    _resetPanels();

    panel['isExpanded'] = true;
    item['isSelected'] = true;

    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => _currentWidget(item)));
  }

  String _title(int index) {
    String? title = home_panels[index]['title'] as String?;
    return title ?? "null";
  }

  bool _isExpanded(int index) {
    bool? isExpanded = home_panels[index]['isExpanded'] as bool?;
    return isExpanded ?? false;
  }

  Widget _currentWidget(Map<String, Object> item) {
    Widget currentWidget = item['pageBuilder'] as Widget;
    return currentWidget;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: ListView(
        children: [
          ExpansionPanelList(
            expansionCallback: _onExpand,
            children: home_panels
                .asMap()
                .map(
                  (index, panel) => MapEntry(
                    index,
                    ExpansionPanel(
                      headerBuilder: (context, isExpanded) => ListTile(
                        onTap: () => _onExpand(index, panel['isExpanded']),
                        title: Text(
                          _title(index),
                          style: const TextStyle(fontSize: 16),
                        ),
                        selected: isExpanded,
                        dense: true,
                      ),
                      body: Container(
                        padding: const EdgeInsets.only(left: 15),
                        child: Column(
                          children: (panel['items'] as List)
                              .map((item) => ListTile(
                                    onTap: () => _onSelected(panel, item),
                                    title: Text(item['title']),
                                    selected: item['isSelected'],
                                    dense: true,
                                    enabled: item['pageBuilder'] != null,
                                  ))
                              .toList(),
                        ),
                      ),
                      isExpanded: _isExpanded(index),
                    ),
                  ),
                )
                .values
                .toList(),
          ),
        ],
      ),
    );
  }
}
