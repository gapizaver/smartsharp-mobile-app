import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../message.dart';

class LockButton extends StatelessWidget {
  const LockButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
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
            ScaffoldMessenger.of(context).showSnackBar(msg.build(context));
          } else {
            debugPrint("Request failed with status ${response.statusCode}");
            // display pop up message
            var msg = const Message(text: "Request to lock Smartsharp failed");
            ScaffoldMessenger.of(context).showSnackBar(msg.build(context));
          }
        } on SocketException {
          debugPrint(
              "Unable to connect to Smartsharp. Make sure you are connected to the Smartsharp network");
          var msg = const Message(
              text:
                  "Unable to connect to Smartsharp. Make sure you are connected to the Smartsharp network");
          ScaffoldMessenger.of(context).showSnackBar(msg.build(context));
        } catch (e) {
          debugPrint("Connection failed: $e");
        }
      },
      child: const Icon(
        Icons.lock,
        color: Colors.white,
      ),
    );
  }
}
