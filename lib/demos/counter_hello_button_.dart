import 'package:flutter/material.dart';
import 'package:flutter_hwa/product/language/language_items.dart';

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
        child: Text("${LanguageItems.welcomeTitle} $_counterCustom"));
  }
}
