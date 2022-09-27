import 'package:flutter/material.dart';
import 'package:flutter_hwa/101/list_view_learn.dart';
import 'package:flutter_hwa/101/text_field_learn.dart';

class TabLearn extends StatefulWidget {
  const TabLearn({Key? key}) : super(key: key);

  @override
  State<TabLearn> createState() => _TabLearnState();
}

//TabBarı olan bir ekran için body kısmında DefaultTabController ile başla
//lenght : Kaça adet sayfa olacağı
//Child : Scaffold vererek devam et

//Bar Kısmı yukarıda olacaksa AppBarda bulunan bottom propertsine TabBar ver.
//Bar kısmı aşağısa olacaksa scaffolda bulunan bottomNavigationBar propertisine BottomAppBar ver.

//TABCONNTROLLER
//Controller ile sayfa kontrolü başka elemanlar tarafından da yapılabilir
//Controller initState de oluşturulurken vsync hatası için ...state clasına  with TickerProviderStateMixi clasını dahil et ve vsync: this olarak değiştir...

class _TabLearnState extends State<TabLearn> with TickerProviderStateMixin {
  late final TabController controller;
  final double _notchedValue = 10;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: _MyTabViews.values.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: _MyTabViews.values.length,
        child: Scaffold(
          extendBody: true, //Ortaya gelen floatingActionButton arka planını trasnparan yapar
          appBar: AppBar(
              //bottom: TabBar(controller: controller, tabs: [Tab(text: "Page1"), Tab(text: "Page1")]),
              ),
          floatingActionButton: FloatingActionButton(
            onPressed: (() {
              controller.animateTo(_MyTabViews.home.index);
            }),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation
              .centerDocked, //FloatingActionButton TabBarın ortasına alır
          bottomNavigationBar: BottomAppBar(
            /////
            notchMargin: _notchedValue, //FloatingActionButton etrafındaki boşluk
            shape: const CircularNotchedRectangle(), // FloatingActionButton boşluğun şekli
            /////
            child: _myTab(),
          ),
          body: _tabBarView(),
        ));
  }

  TabBar _myTab() {
    return TabBar(
      controller: controller,
      padding: EdgeInsets.zero,
      onTap: (int value) {},
      tabs: _MyTabViews.values
          .map((e) => Tab(
                child: Text("${e.name}"),
              ))
          .toList(),
    );
  }

  TabBarView _tabBarView() {
    return TabBarView(
      physics: const NeverScrollableScrollPhysics(), //Tabbar sayfalarını elle sürüklemeyi kapatır
      controller: controller,
      children: const [ListViewLearn(), TextFieldLearn(), ListViewLearn(), TextFieldLearn()],
    );
  }
}

enum _MyTabViews { home, settings, favorite, profile }

extension _MyTabViewsExtension on _MyTabViews {}
