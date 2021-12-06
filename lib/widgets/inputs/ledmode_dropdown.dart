import 'package:flutter/material.dart';
import 'package:smart_sharp/api.dart';

class LedModeDropdown extends StatefulWidget {
  const LedModeDropdown({Key? key}) : super(key: key);

  @override
  _LedModeDropdownState createState() => _LedModeDropdownState();
}

class _LedModeDropdownState extends State<LedModeDropdown> {
  String dropdownValue = "0";

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      const Text("Led Mode: "),
      DropdownButton<String>(
          value: dropdownValue,
          onChanged: (String? newValue) {
            setState(() {
              // change mode
              dropdownValue = newValue!;
              var mode = dropdownValue.split(" ")[1];
              APIRequest.changeMode(context, mode);
            });
          },
          items: <String>[
            "Mode 0",
            "Mode 1",
            "Mode 2",
            "Mode 3",
            "Mode 4",
            "Mode 5"
          ].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem(child: Text(value), value: value);
          }).toList()),
    ]);
  }
}
