import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'widgets/message.dart';

class APIRequest {
  static void lock(context) async {
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
  }

  static void unlock(context) async {
    // request Smartsharp to unlock
    http.Response response;
    try {
      // http request
      response = await http.get(Uri.http('192.168.4.1', 'unlock'));

      // debug print resplonse code
      if (response.statusCode == 200) {
        debugPrint("Request succeed");
        // display pop up message
        var msg = const Message(text: "Smartsharp unlocked");
        ScaffoldMessenger.of(context).showSnackBar(msg.build(context));
      } else {
        debugPrint("Request failed with status ${response.statusCode}");
        // display pop up message
        var msg = const Message(text: "Request to unlock Smartsharp failed");
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
  }
}
