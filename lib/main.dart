import 'package:flutter/material.dart';
import 'package:flutter_hwa/101/color_life_cycle_view.dart';
import 'package:flutter_hwa/101/coulmn_row_learn.dart';
import 'package:flutter_hwa/101/custom_widget_learm.dart';
import 'package:flutter_hwa/101/indicator_learn.dart';
import 'package:flutter_hwa/101/list_tile_learn.dart';
import 'package:flutter_hwa/101/list_view_builder_learn.dart';
import 'package:flutter_hwa/101/list_view_learn.dart';
import 'package:flutter_hwa/101/navigation_learn.dart';
import 'package:flutter_hwa/101/page_view_learn.dart';
import 'package:flutter_hwa/101/stack_learn.dart';
import 'package:flutter_hwa/101/stateful_life_cycle_learn.dart';
import 'package:flutter_hwa/101/statefull_lean.dart';
import 'package:flutter_hwa/101/text_field_learn.dart';
import 'package:flutter_hwa/202/model_learn_wiev.dart';
import 'package:flutter_hwa/202/services/services_post_learn_view.dart';
import 'package:flutter_hwa/202/services/services_view_learn.dart';
import 'package:flutter_hwa/202/tab_learn.dart';
import 'package:flutter_hwa/demos/color_demos_view.dart';
import 'package:flutter_hwa/demos/my_collections_demos.dart';
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
          tabBarTheme: const TabBarTheme(
              labelColor: Colors.white,
              unselectedLabelColor: Colors.grey,
              indicatorSize: TabBarIndicatorSize.label),
          listTileTheme: ListTileThemeData(contentPadding: EdgeInsets.zero),
          progressIndicatorTheme: ProgressIndicatorThemeData(color: Colors.white),
          // primarySwatch: Colors.green,
          brightness: Brightness.dark),
      home: ServicesPostViewLearn(),
    );
  }
}
