import 'package:flutter/material.dart';

import 'widgets/buttons/lock.dart';
import 'widgets/buttons/unlock.dart';
import 'widgets/inputs/ledinput.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Smartsharp',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyScaffold());
  }
}

class MyScaffold extends StatefulWidget {
  const MyScaffold({Key? key}) : super(key: key);

  @override
  _MyScaffoldState createState() => _MyScaffoldState();
}

class _MyScaffoldState extends State<MyScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Smartsharp')),
      body: Column(children: [
        // lock, unlock row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            LockButton(),
            UnlockButton(),
          ],
        ),
        // LED0 row
        const LedInputWidget(ledId: 0),
        // LED1 row
        const LedInputWidget(ledId: 1),
      ]),
    );
  }
}
