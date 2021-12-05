import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  final String text;
  const Message({Key? key, required this.text}) : super(key: key);

  @override
  SnackBar build(BuildContext context) {
    return SnackBar(
        content: Text(text),
        action: SnackBarAction(
          label: "Ok",
          onPressed: () {},
        ));
  }
}
