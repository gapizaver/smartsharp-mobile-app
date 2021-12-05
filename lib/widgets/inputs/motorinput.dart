import 'package:flutter/material.dart';
import 'package:smart_sharp/api.dart';

// stateful widget for led color input
class MotorInputWidget extends StatefulWidget {
  const MotorInputWidget({Key? key}) : super(key: key);

  @override
  State<MotorInputWidget> createState() => _MotorInputWidget();
}

class _MotorInputWidget extends State<MotorInputWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var time = ["0", "0"]; // seconds and miliseconds
  var list = ["s", "ms"];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.always,
      child: Container(
        padding: const EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Run motor',
            ),
            Wrap(
              children: List<Widget>.generate(2, (int index) {
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
                      decoration: InputDecoration(labelText: list[index % 2]),
                      keyboardType: TextInputType.number,
                      onChanged: (String val) {
                        time[index] = val;
                      },
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
              onPressed: () {
                APIRequest.runMotor(context, time[0], time[1]);
              },
              child: const Text("Run motor"),
            ),
          ],
        ),
      ),
    );
  }
}
