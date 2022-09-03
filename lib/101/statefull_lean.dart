import 'package:flutter/material.dart';
import 'package:flutter_hwa/demos/counter_hello_button_.dart';

class StatefullLearn extends StatefulWidget {
  const StatefullLearn({Key? key}) : super(key: key);

  @override
  State<StatefullLearn> createState() => _StatefullLearnState();
}

class _StatefullLearnState extends State<StatefullLearn> {
  int _counter = 0;

  void CounterUpdate(bool isIncrement) {
    print("burada");
    if (isIncrement) {
      _counter++;
    } else {
      _counter--;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [_azaltButton(), _arttirButton()],
      ),
      appBar: AppBar(),
      body: Column(
        children: [
          Center(
              child: Text(
            _counter.toString(),
            style: Theme.of(context).textTheme.headline2,
          )),
          Placeholder(),
          CounterHelloWidget(),
        ],
      ),
    );
  }

  Padding _arttirButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: FloatingActionButton(
        onPressed: () {
          CounterUpdate(true);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  FloatingActionButton _azaltButton() {
    return FloatingActionButton(
      onPressed: () {
        CounterUpdate(false);
      },
      child: Icon(Icons.remove),
    );
  }
}
