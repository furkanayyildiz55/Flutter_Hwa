import 'package:flutter/material.dart';

class StatefulLifeCycleLearn extends StatefulWidget {
  const StatefulLifeCycleLearn({Key? key, required this.message}) : super(key: key);
  //Bu alana getirdiğimiz veriler başka yerlerden etkilenmemeli ve değişmemeli o yüzden final ayarladık
  final String message;

  @override
  State<StatefulLifeCycleLearn> createState() => _StatefulLifeCycleLearnState();
}

class _StatefulLifeCycleLearnState extends State<StatefulLifeCycleLearn> {
  String _message = "";
  late final bool _isOdd;
  //Final değeri sonradan değiştirilemez anlamına gelir
  //Late değerin sonradan aktarılacağını belirtir

  //İnitState ekran çizilmeden yani build methodu çalıştırılmadan önce çalıştırılır ardından ekran çizilir.
  //aynı constructor mantığı ile çalışmaktadır.
  @override
  void initState() {
    super.initState();

    _message = widget.message;
    _isOdd = _message.length.isOdd;
    _computeName();
  }

  @override
  void didUpdateWidget(covariant StatefulLifeCycleLearn oldWidget) {
    //Eski widget değerlerini verir. Böylelikle eski widget ile yeni widget arası işlemler yapılabilir.
    //İlk çizinde değilde ikinci çizimde widget içerisinde değişiklik varsa çalışır
    super.didUpdateWidget(oldWidget);
    print("didUpdate");
    if (oldWidget.message != widget.message) {
      _message = widget.message;
      _computeName();
    }
  }

  @override
  void dispose() {
    //Sayfa ile işimiz bittiğinde navigatör işlemlerinde çalışır...
    //Sayfamızdali değişkenlerimizi burada temizlemeliyiz...
    super.dispose();
    _message = "";
  }

  void _computeName() {
    if (_isOdd) {
      _message += "Çift";
    } else {
      _message += "Tek";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_message),
      ),
      body: _isOdd
          ? TextButton(onPressed: () {}, child: Text(_message))
          : ElevatedButton(onPressed: () {}, child: Text(_message)),
    );
  }
}
