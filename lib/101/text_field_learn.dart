import 'package:flutter/material.dart';

class TextFieldLearn extends StatefulWidget {
  const TextFieldLearn({Key? key}) : super(key: key);

  @override
  State<TextFieldLearn> createState() => _TextFieldLearnState();
}

class _TextFieldLearnState extends State<TextFieldLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: TextField(
          //textFiel ile ilgili anlık durumları verir
          buildCounter: (BuildContext context, {int? currentLength, bool? isFocused, int? maxLength}) {
            return AnimatedContainer(
              duration: Duration(milliseconds: 100),
              child: Container(
                height: 10,
                width: 250,
                  color:Colors.green[100*((currentLength ?? 0 ) ~/2 )] ,
              ),
            );
          },
          maxLength: 20,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.mail),
            border: OutlineInputBorder(),
            labelText: "Mail",
          ),
        ),
      ),
    );
  }
}
