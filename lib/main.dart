import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:smart_sharp/widgets/message.dart';

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
          children: [
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
              onPressed: () async {
                // request Smartsharp to lock
                http.Response response;
                try {
                  response = await http.get(Uri.http('192.168.4.1', 'lock'));

                  // debug print resplonse code
                  if (response.statusCode == 200) {
                    debugPrint("Request succeed");
                    // display pop up message
                    var msg = const Message(text: "Smartsharp locked");
                    ScaffoldMessenger.of(context)
                        .showSnackBar(msg.build(context));
                  } else {
                    debugPrint(
                        "Request failed with status ${response.statusCode}");
                    // display pop up message
                    var msg = const Message(
                        text: "Request to lock Smartsharp failed");
                    ScaffoldMessenger.of(context)
                        .showSnackBar(msg.build(context));
                  }
                } on SocketException {
                  debugPrint(
                      "Unable to connect to Smartsharp. Make sure you are connected to the Smartsharp network");
                  var msg = const Message(
                      text:
                          "Unable to connect to Smartsharp. Make sure you are connected to the Smartsharp network");
                  ScaffoldMessenger.of(context)
                      .showSnackBar(msg.build(context));
                } catch (e) {
                  debugPrint("Connection failed: $e");
                }
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
              onPressed: () async {
                // request Smartsharp to lock
                http.Response response;
                try {
                  response = await http.get(Uri.http('192.168.4.1', 'unlock'));

                  // debug print resplonse code
                  if (response.statusCode == 200) {
                    debugPrint("Request succeed");
                    // display pop up message
                    var msg = const Message(text: "Smartsharp locked");
                    ScaffoldMessenger.of(context)
                        .showSnackBar(msg.build(context));
                  } else {
                    debugPrint(
                        "Request failed with status ${response.statusCode}");
                    // display pop up message
                    var msg = const Message(
                        text: "Request to unlock Smartsharp failed");
                    ScaffoldMessenger.of(context)
                        .showSnackBar(msg.build(context));
                  }
                } on SocketException {
                  debugPrint(
                      "Unable to connect to Smartsharp. Make sure you are connected to the Smartsharp network");
                  var msg = const Message(
                      text:
                          "Unable to connect to Smartsharp. Make sure you are connected to the Smartsharp network");
                  ScaffoldMessenger.of(context)
                      .showSnackBar(msg.build(context));
                } catch (e) {
                  debugPrint("Connection failed: $e");
                }
              },
              child: const Icon(
                Icons.lock_open,
                color: Colors.white,
              ),
            ),
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

// stateful widget for led color input
class LedInputWidget extends StatefulWidget {
  final int ledId;
  const LedInputWidget({Key? key, required this.ledId}) : super(key: key);

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
            Text(
              'LED' + widget.ledId.toString() + ' RGB [0-255]',
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
              child: Text("Change LED" + widget.ledId.toString()),
            ),
          ],
        ),
      ),
    );
  }
}
