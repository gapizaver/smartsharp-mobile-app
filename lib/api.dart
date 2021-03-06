import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'widgets/message.dart';

class APIRequest {
  // Smartsharp's ip
  static const ssip = '192.168.4.1';

  static void lock(context) async {
    // request Smartsharp to locks
    http.Response response;
    try {
      response = await http.get(Uri.http(ssip, 'lock'));

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
      response = await http.get(Uri.http(ssip, 'unlock'));

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

  static void setLed(
      context, String ledId, String r, String g, String b) async {
    // request Smartsharp to unlock
    http.Response response;
    try {
      // http request
      response = await http.get(
          Uri.http(ssip, 'ledrgb', {"r": r, "g": g, "b": b, "led": ledId}));

      // debug print resplonse code
      if (response.statusCode == 200) {
        debugPrint("Request succeed");
        // display pop up message
        var msg = const Message(text: "Smartsharp led set");
        ScaffoldMessenger.of(context).showSnackBar(msg.build(context));
      } else {
        debugPrint("Request failed with status ${response.statusCode}");
        // display pop up message
        var msg = const Message(text: "Request to set led Smartsharp failed");
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

  static void runMotor(context, String s, String ms) async {
    // request Smartsharp to unlock
    http.Response response;
    try {
      // http request
      response = await http
          .get(Uri.http(ssip, 'runmotor', {"seconds": s, "milis": ms}));

      // debug print resplonse code
      if (response.statusCode == 200) {
        debugPrint("Request succeed");
        // display pop up message
        var msg = const Message(text: "Smartsharp motor run");
        ScaffoldMessenger.of(context).showSnackBar(msg.build(context));
      } else {
        debugPrint("Request failed with status ${response.statusCode}");
        // display pop up message
        var msg = const Message(text: "Request to run motor failed");
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

  static void changeMode(context, String mode) async {
    // request Smartsharp to unlock
    http.Response response;
    try {
      // http request
      response = await http.get(Uri.http(ssip, 'ledmode', {"mode": mode}));

      // debug print resplonse code
      if (response.statusCode == 200) {
        debugPrint("Request succeed");
        // display pop up message
        var msg = const Message(text: "Smartsharp mode changed");
        ScaffoldMessenger.of(context).showSnackBar(msg.build(context));
      } else {
        debugPrint("Request failed with status ${response.statusCode}");
        // display pop up message
        var msg = const Message(text: "Request to change mode failed");
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
