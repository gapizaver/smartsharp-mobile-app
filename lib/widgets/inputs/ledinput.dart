import 'package:flutter/material.dart';
import 'package:smart_sharp/api.dart';

// stateful widget for led color input
class LedInputWidget extends StatefulWidget {
  final int ledId;
  const LedInputWidget({Key? key, required this.ledId}) : super(key: key);

  @override
  State<LedInputWidget> createState() => _LedInputWidget();
}

class _LedInputWidget extends State<LedInputWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var rgb = ["0", "0", "0"];

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
                      onChanged: (String val) {
                        rgb[index] = val;
                        debugPrint("rgb " + rgb[0] + rgb[1] + rgb[2]);
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
                APIRequest.setLed(
                    context, widget.ledId.toString(), rgb[0], rgb[1], rgb[2]);
              },
              child: Text("Change LED" + widget.ledId.toString()),
            ),
          ],
        ),
      ),
    );
  }
}
