import 'package:flutter/material.dart';
import 'package:flutter_hwa/demos/color_demos_view.dart';

class ColorLifeCycleView extends StatefulWidget {
  const ColorLifeCycleView({Key? key}) : super(key: key);

  @override
  State<ColorLifeCycleView> createState() => _ColorLifeCycleViewState();
}

class _ColorLifeCycleViewState extends State<ColorLifeCycleView> {
  Color? _backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
          icon: Icon(Icons.clear),
          onPressed: _changeBacgroundColor,
        )
      ]),
      body: Column(
        children: [
          const Spacer(),
          Expanded(
              child: ColorDemos(
            intialColor: _backgroundColor,
          ))
        ],
      ),
    );
  }

  void _changeBacgroundColor() {
    setState(() {
      _backgroundColor = Colors.pink;
    });
  }
}
