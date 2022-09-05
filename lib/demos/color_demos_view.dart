import 'dart:developer';

import 'package:flutter/material.dart';

class ColorDemos extends StatefulWidget {
  const ColorDemos({Key? key, required this.intialColor}) : super(key: key);
  final Color? intialColor; //Üst sayfadan Null gönderebilirsin ben kontrol edecem demek

  @override
  State<ColorDemos> createState() => _ColorDemosState();
}

class _ColorDemosState extends State<ColorDemos> {
  Color? _backGroundColor;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _backGroundColor = widget.intialColor ?? Colors.transparent;
  }

  //En çok üst widget den güncelleme geldiğinde kullanılır
  @override
  void didUpdateWidget(covariant ColorDemos oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    inspect(widget);
    if (widget.intialColor != _backGroundColor && widget.intialColor != null) {
      ChangeBackgroundColor(widget.intialColor!);
    }
  }

  void ChangeBackgroundColor(Color color) {
    setState(() {
      _backGroundColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backGroundColor,
      bottomNavigationBar: BottomNavigationBar(onTap: _colorOnTap, items: [
        BottomNavigationBarItem(
          icon: _ColorContainer(
            color: Colors.red,
          ),
          label: "Red",
        ),
        BottomNavigationBarItem(
          icon: _ColorContainer(
            color: Colors.yellow,
          ),
          label: "Yellow",
        ),
        BottomNavigationBarItem(
          icon: _ColorContainer(
            color: Colors.blue,
          ),
          label: "Blue",
        ),
      ]),
    );
  }

  void _colorOnTap(int value) {
    if (value == _MyColors.red.index) {
      ChangeBackgroundColor(Colors.red);
    } else if (value == _MyColors.yellow.index) {
      ChangeBackgroundColor(Colors.yellow);
    } else if (value == _MyColors.blue.index) {
      ChangeBackgroundColor(Colors.blue);
    }
  }
}

enum _MyColors { red, yellow, blue }

class _ColorContainer extends StatelessWidget {
  _ColorContainer({
    Key? key,
    this.color,
  }) : super(key: key);
  final color;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      height: 10,
      width: 10,
    );
  }
}
