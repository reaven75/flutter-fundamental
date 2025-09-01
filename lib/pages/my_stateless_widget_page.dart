import 'package:flutter/material.dart';
import 'package:flutter_fundamental/pages/my_stateful_widget_page.dart';

class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({super.key});

  void _nextPage(BuildContext context) {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          return const MyStatefulWidget();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('My Stateless Widget'),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('You have pushed this button to go to MyStatefulWidget page'),
              FloatingActionButton.small(onPressed: () {
                _nextPage(context);
              },
              heroTag: "go to stateful Widget",
              tooltip: "Next",
              child: Icon(Icons.next_plan_outlined),
              )
            ],
          ),
      ),
    );
  }
}
