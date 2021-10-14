import 'package:flutter/material.dart';

class ReturnDataPage extends StatelessWidget {
  const ReturnDataPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Return Data'),
      ),
      body: Builder(
        builder: (context) => Center(
          child: ElevatedButton(
              onPressed: () async {
                final result = await Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => _SelectionPage()),
                );
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(result)));
              },
              child: const Text('Pick an option, any option!')),
        ),
      ),
    );
  }
}

class _SelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick an option'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: ElevatedButton(
                onPressed: () => Navigator.of(context).pop('Yep!'),
                child: const Text('Yep!'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: ElevatedButton(
                onPressed: () => Navigator.of(context).pop('Nope.'),
                child: const Text('Nope.'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
