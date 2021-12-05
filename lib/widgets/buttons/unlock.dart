import 'package:flutter/material.dart';
import 'package:smart_sharp/api.dart';

class UnlockButton extends StatelessWidget {
  const UnlockButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
      ),
      onPressed: () {
        APIRequest.unlock(context);
      },
      child: const Icon(
        Icons.lock_open,
        color: Colors.white,
      ),
    );
  }
}
