import 'package:flutter/material.dart';
import 'package:flutter_hwa/101/coulmn_row_learn.dart';
import 'package:flutter_hwa/101/custom_widget_learm.dart';
import 'package:flutter_hwa/101/indicator_learn.dart';
import 'package:flutter_hwa/101/list_tile_learn.dart';
import 'package:flutter_hwa/101/stack_learn.dart';
import 'package:flutter_hwa/101/statefull_lean.dart';
import 'package:flutter_hwa/demos/stack_demos_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        listTileTheme: ListTileThemeData(contentPadding: EdgeInsets.zero),
        progressIndicatorTheme: ProgressIndicatorThemeData(color: Colors.white),
        primarySwatch: Colors.red,
              ),
      home:  StatefullLearn(),
    );
  }
}

