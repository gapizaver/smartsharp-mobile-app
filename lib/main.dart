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
        body: Column(children: [
          // lock, unlock row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
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
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
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
          // LED1 row
          const LedInputWidget(),
        ]),
      ),
    );
  }
}

// stateful widget for led color input
class LedInputWidget extends StatefulWidget {
  const LedInputWidget({Key? key}) : super(key: key);

  @override
  State<LedInputWidget> createState() => _LedInputWidget();
}

class _LedInputWidget extends State<LedInputWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    const _list = ["Red", "Green", "Blue"];

    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.always,
      child: Container(
        padding: const EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'LED1 RGB [0-255]',
            ),
            Wrap(
              children: List<Widget>.generate(3, (int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ConstrainedBox(
                    constraints: BoxConstraints.tight(const Size(100, 50)),
                    child: TextFormField(
                      /*validator: (String? value) {
                        return (value != null)
                            ? "Input value between [0,255]"
                            : null;
                      },*/
                      decoration: InputDecoration(labelText: _list[index % 3]),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                );
              }),
            ),
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
              onPressed: () {},
              child: const Text("Change LED1"),
            ),
          ],
        ),
      ),
    );
  }
}
