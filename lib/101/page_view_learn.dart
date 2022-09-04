import 'package:flutter/material.dart';

///Page View : Tek bir ekranda sağa veya sola kaydırarak farklı ekranlara yapılara geçiş sağlamamızı sağlar
class PageViewLearn extends StatefulWidget {
  const PageViewLearn({Key? key}) : super(key: key);

  @override
  State<PageViewLearn> createState() => _PageViewLearnState();
}

class _PageViewLearnState extends State<PageViewLearn> {
  final _pageController = PageController(viewportFraction: 0.9);
  
  int _currentPageIndex = 0;
  void currentPageIndex(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
           Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(_currentPageIndex.toString()),
          ),
          const Spacer(), //Spacer komşuşu olan diğer iki öğe arasına olabildiğince boşluk eklemeye çalışır

          FloatingActionButton(
            onPressed: (() {
              _pageController.previousPage(duration: _DurationUtility._durationLow, curve: Curves.easeOutQuint);
            }),
            child: Icon(Icons.chevron_left),
          ),
          FloatingActionButton(
            onPressed: (() {
              _pageController.nextPage(duration: _DurationUtility._durationLow, curve: Curves.easeOutQuint);
            }),
            child: Icon(Icons.chevron_right),
          )
        ],
      ),
      appBar: AppBar(),
      body: PageView(
        onPageChanged: currentPageIndex,
        padEnds: false,
        //Gösterilecek ilk sayfayı en sola yaslı şekilde gösterir. Başlangıçtan başlatır. True de ise ortalar
        controller: _pageController,
        //viewportFraction ile ekranları verilen oranda küçülterek diğer sağdaki ekranın gözükmesini, yani önizlemesini sağlayabiliriz.
        children: [
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.lightGreenAccent,
          ),
          Container(
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}

class _DurationUtility {
  static const _durationLow = Duration(seconds: 1);
}
