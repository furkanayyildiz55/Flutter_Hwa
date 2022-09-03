import 'package:flutter/material.dart';

class CounterHelloWidget extends StatefulWidget {
  const CounterHelloWidget({Key? key}) : super(key: key);

  @override
  State<CounterHelloWidget> createState() => _CounterHelloWidgetState();
}

class _CounterHelloWidgetState extends State<CounterHelloWidget> {
  int _counterCustom = 0;

  void _updateCounter() {
    setState(() {
      ++_counterCustom;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: _updateCounter,
        child: Text("Merhaba $_counterCustom"));
  }
}
