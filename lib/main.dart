import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
      home: Scaffold(
        appBar: AppBar(title: const Text('Smartsharp')),

        // lock, unlock row
        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
              onPressed: () {
                //http.get(Uri.http('192.168.64.123:8000', 'sega'));
                http.get(Uri.http('192.168.4.1', 'lock'));
              },
              child: const Icon(
                Icons.lock,
                color: Colors.white,
              ),
            ),
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
              onPressed: () {
                http.get(Uri.http('192.168.4.1', 'unlock'));
              },
              child: const Icon(
                Icons.lock_open,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
