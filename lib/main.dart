import 'package:flutter/material.dart';
import 'package:smart_sharp/widgets/inputs/ledmode_dropdown.dart';
import 'package:smart_sharp/widgets/inputs/motorinput.dart';

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
        // LED mode input
        const LedModeDropdown(),
        // LED0 form input
        const LedInputWidget(ledId: 0),
        // LED1 form input
        const LedInputWidget(ledId: 1),
        // run motor input
        const MotorInputWidget(),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 40.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              LockButton(),
              UnlockButton(),
            ],
          ),
        ),
      ]), // lock, unlock row
    );
  }
}
