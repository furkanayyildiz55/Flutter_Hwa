import 'package:flutter/material.dart';

class LightTheme {
  final _lightColor = _LightColor();
  //Color gibi değişkenlerimi çekiyorum
  //Bu değişkenler çalışma zamanında initialize edileceğinden direkt olarak theme'e verilemez
  //vermek için theme'i late ile değeri sonradan verilecek diye işaretliyorum
  //LightTheme contrutorı ile de them'e asıl değerlerini veriyorum

  //Bir projedeki renkler genellikler birbirini tutar seviyededir. Fakat bir elementi özellikle farklı renk istiyorsak color scheme kullanılabilir
  //Bu özellik ile birden fazla renk tanımlaması yapılabilir
  //şeklinde kullanımı vardır--->>  Theme.of(context).buttonTheme.colorScheme?.onPrimary

  late ThemeData theme;

  LightTheme() {
    theme = ThemeData(
      appBarTheme: const AppBarTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
      ),
      scaffoldBackgroundColor: Colors.white.withOpacity(0.9),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(backgroundColor: Colors.green),
      textTheme: ThemeData.light().textTheme.copyWith(
            subtitle1: TextStyle(fontSize: 20, color: _lightColor._textColor),
          ),
      buttonTheme: ButtonThemeData(
        colorScheme: ColorScheme.light(
            onPrimary: _lightColor._buttonColor, onSecondary: _lightColor._buttonColorSecondary),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.all(Colors.green),
      ),
    );
  }

  ThemeData DefaultTheme = ThemeData.light();
}

class _LightColor {
  final Color _textColor = Color.fromARGB(255, 91, 110, 120);
  final Color _buttonColor = Color.fromARGB(255, 11, 150, 225);
  final Color _buttonColorSecondary = Color.fromARGB(255, 11, 150, 1);
}
