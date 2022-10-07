import 'package:flutter/material.dart';
import 'package:flutter_hwa/202/theme/password_textfield.dart';

class ThemeLearnView extends StatefulWidget {
  const ThemeLearnView({Key? key}) : super(key: key);

  @override
  State<ThemeLearnView> createState() => _ThemeLearnViewState();
}

class _ThemeLearnViewState extends State<ThemeLearnView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            PasswordTextField(),
            CheckboxListTile(
              title: Text("Select"),
              value: true,
              onChanged: (val) {},
            ),
          ],
        ));
  }
}
