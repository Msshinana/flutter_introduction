import 'package:flutter/material.dart';

class TapboxPage extends StatelessWidget {
  const TapboxPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tapbox'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _TapboxA(),
            _TapboxBParent(),
            _TapboxCParent(),
          ],
        ),
      ),
    );
  }
}

class _TapboxA extends StatefulWidget {
  @override
  _TapboxAState createState() => _TapboxAState();
}

class _TapboxAState extends State<_TapboxA> {
  bool _active = false;

  void _onTap() {
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: Container(
        alignment: Alignment.center,
        child: Text(
          _active ? 'Active' : 'Inactive',
          style: const TextStyle(fontSize: 32, color: Colors.white),
        ),
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          color: _active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
      ),
    );
  }
}

class _TapboxBParent extends StatefulWidget {
  @override
  _TapboxBParentState createState() => _TapboxBParentState();
}

class _TapboxBParentState extends State<_TapboxBParent> {
  bool _active = false;

  void _onChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _TapboxB(
      active: _active,
      onChanged: _onChanged,
    );
  }
}

class _TapboxB extends StatelessWidget {
  final bool active;
  final ValueChanged<bool> onChanged;

  const _TapboxB({
    Key? key,
    this.active = false,
    required this.onChanged,
  }) : super(key: key);

  void _onTap() {
    onChanged(!active);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: Container(
        alignment: Alignment.center,
        child: Text(
          active ? 'Active' : 'Inactive',
          style: const TextStyle(fontSize: 32, color: Colors.white),
        ),
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          color: active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
      ),
    );
  }
}

class _TapboxCParent extends StatefulWidget {
  @override
  _TapboxCParentState createState() => _TapboxCParentState();
}

class _TapboxCParentState extends State<_TapboxCParent> {
  bool _active = false;

  void _onChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _TapboxC(
      active: _active,
      onChanged: _onChanged,
    );
  }
}

class _TapboxC extends StatefulWidget {
  final bool active;
  final ValueChanged<bool> onChanged;
  const _TapboxC({
    Key? key,
    required this.active,
    required this.onChanged,
  }) : super(key: key);
  @override
  _TapboxCState createState() => _TapboxCState();
}

class _TapboxCState extends State<_TapboxC> {
  bool _highlight = false;

  void _onTapDown(TapDownDetails details) {
    setState(() {
      _highlight = true;
    });
  }

  void _onTapUp(TapUpDetails details) {
    setState(() {
      _highlight = false;
    });
  }

  void _onTapCancel() {
    setState(() {
      _highlight = false;
    });
  }

  void _onTap() {
    widget.onChanged(!widget.active);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      onTap: _onTap,
      child: Container(
        alignment: Alignment.center,
        child: Text(
          widget.active ? 'Active' : 'Inactive',
          style: const TextStyle(fontSize: 32, color: Colors.white),
        ),
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          color: widget.active ? Colors.lightGreen[700] : Colors.grey[600],
          border: _highlight
              ? Border.all(
                  color: Colors.teal,
                  width: 10,
                )
              : null,
        ),
      ),
    );
  }
}
