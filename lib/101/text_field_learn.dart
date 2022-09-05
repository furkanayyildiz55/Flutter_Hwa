import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hwa/product/language/language_items.dart';

// ders 6 da focusNode özelliği var.... 1,25,00 dk
//next ile sonraki textfied a geçme

class TextFieldLearn extends StatefulWidget {
  const TextFieldLearn({Key? key}) : super(key: key);

  @override
  State<TextFieldLearn> createState() => _TextFieldLearnState();
}

class _TextFieldLearnState extends State<TextFieldLearn> {
  final key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: TextField(
          maxLength: 20,
          keyboardType: TextInputType.emailAddress,
          autofillHints: const [AutofillHints.email], //otomatik klavye önerilerini açar
          /* inputFormatters: [
            TextProjectInputFormatter()._formatter
          ], //yazılan eski ve yeni karakteri veriyor yazı kontrolü yapabiliyoruz. Yazı sınırlaması vs.
*/
          decoration: _InpuDecarator().emailInput,
          //textFiel ile ilgili anlık durumları verir
          buildCounter: (BuildContext context, {int? currentLength, bool? isFocused, int? maxLength}) {
            return _animatedContainer(currentLength);
          },
        ),
      ),
    );
  }

  AnimatedContainer _animatedContainer(int? currentLength) {
    final screenWidth = MediaQuery.of(context).size.width;
    final onePartial = screenWidth / 20;
    return AnimatedContainer(
      key: key,
      duration: const Duration(seconds: 1),
      height: 10,
      width: onePartial * (currentLength ?? 0),
      color: Colors.green,
    );
  }
}

class TextProjectInputFormatter {
  final _formatter = TextInputFormatter.withFunction((oldValue, newValue) {
    if (newValue.text == "a") {
      return oldValue;
    } else {
      return oldValue;
    }
  });
}

class _InpuDecarator {
  final emailInput = const InputDecoration(
    prefixIcon: Icon(Icons.mail),
    border: OutlineInputBorder(),
    labelText: LanguageItems.emailTitle,
  );
}
