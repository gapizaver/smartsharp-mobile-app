import 'package:flutter/material.dart';
import 'package:smart_sharp/api.dart';

class LockButton extends StatelessWidget {
  const LockButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
      ),
      onPressed: () => {APIRequest.lock(context)},
      child: const Icon(
        Icons.lock,
        color: Colors.white,
      ),
    );
  }
}
