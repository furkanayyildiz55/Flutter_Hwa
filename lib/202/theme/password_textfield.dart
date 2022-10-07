import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({Key? key, this.controller}) : super(key: key);
  final TextEditingController? controller;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  final _obsecureText = "#";
  bool _isSecure = true;

  void _changeLoading() {
    setState(() {
      _isSecure = !_isSecure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      autofillHints: [AutofillHints.password],
      keyboardType: TextInputType.visiblePassword,
      obscureText: _isSecure, //girilen yazının görülmesini engelliyor
      obscuringCharacter: _obsecureText, //Zorunlu değil default değeri siyah nokta
      decoration: InputDecoration(
        border: UnderlineInputBorder(),
        hintText: "Password",
        suffix: _onVisibilityIcon(),
      ),
    );
  }

  //Bu tarz basit kodları method olarak çıkarmak okunabilirliği sağlar
  IconButton _onVisibilityIcon() {
    return IconButton(
      onPressed: () => _changeLoading(),
      icon: AnimatedCrossFade(
          firstChild: Icon(Icons.visibility_outlined),
          secondChild: Icon(Icons.visibility_off_outlined),
          crossFadeState: _isSecure ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          duration: const Duration(seconds: 2)),
      // icon: Icon(_isSecure ? Icons.visibility : Icons.visibility_off),
    );
  }
}
