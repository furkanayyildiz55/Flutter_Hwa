import 'package:flutter/material.dart';
import 'package:flutter_hwa/101/navigate_detail_learn.dart';
import 'package:flutter_hwa/101/text_field_learn.dart';

class NavigationLearn extends StatefulWidget {
  const NavigationLearn({Key? key}) : super(key: key);

  @override
  State<NavigationLearn> createState() => _NavigationLearnState();
}

//MaterialPageRoute içindeki fullsreendialog özelliği gidilen sayfa animasyonunu aşağıdan yukarı şekilde ayarlar ve geri tuşu yerine çarpı tuşu ayarlar

class _NavigationLearnState extends State<NavigationLearn> with NavigatorManager {
  List<int> selectedItems = [];

  void addSelected(int index , bool isAdd) {
    setState(() {
     isAdd ?  selectedItems.add(index) : selectedItems.remove(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return TextButton(
            onPressed: () async {
              final response = await navigateTOWidgetNormal<bool>(context, NavigateDetailLearn(isOkey:selectedItems.contains(index) ,),
                  fullSecreenDialog: true);

              if (response is bool) {
                addSelected(index , response);
              }
            },
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Placeholder(
                color: selectedItems.contains(index) ? Colors.green : Colors.red,
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.navigate_next_sharp,
        ),
        onPressed: () {},
      ),
    );
  }
}

///mixin : Construcor'ı olmayan class denebilir. with yolu ile başka classa eklenip direkt kullanılabilir
mixin NavigatorManager {
  void navigateTOWidget(BuildContext context, Widget widget, {bool fullSecreenDialog = false}) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: ((context) => widget), fullscreenDialog: fullSecreenDialog));
  }

  Future<T?> navigateTOWidgetNormal<T>(BuildContext context, Widget widget,
      {bool fullSecreenDialog = false}) {
    return Navigator.of(context).push<T>(
        MaterialPageRoute(builder: ((context) => widget), fullscreenDialog: fullSecreenDialog));
  }
}
