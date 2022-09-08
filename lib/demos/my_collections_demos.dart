
import 'package:flutter/material.dart';

class MyCollectionsDemos extends StatefulWidget {
  const MyCollectionsDemos({Key? key}) : super(key: key);

  @override
  State<MyCollectionsDemos> createState() => _MyCollectionsDemosState();
}

class _MyCollectionsDemosState extends State<MyCollectionsDemos> {
  late final List<CollectionModel>
      _items; // late: Sonradan constructorda değer alacak Final : değeri sonradan değiştirilemez

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _items = CollectionItems().items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: PaddingUtility().paddingHorizontal,
        child: ListView.builder(
          itemBuilder: ((context, index) {
            return _categoryCard(
              model: _items[index],
            );
          }),
          itemCount: _items.length,
        ),
      ),
    );
  }
}

class _categoryCard extends StatelessWidget {
  const _categoryCard({
    Key? key,
    required CollectionModel model,
  })  : _model = model,
        super(key: key);

  final CollectionModel _model;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: PaddingUtility().paddingBottom,
      child: SizedBox(
        height: 300,
        child: Padding(
          padding: PaddingUtility().paddingGeneral,
          child: Column(
            children: [
              Expanded(child: Image.network(_model.imagePath)),
              Padding(
                padding: PaddingUtility().paddingTop,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text(_model.title), Text('${_model.price} eth')],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CollectionModel {
  final String imagePath;
  final String title;
  final double price;

  CollectionModel({required this.imagePath, required this.title, required this.price});
}

class CollectionItems {
  late final List<CollectionModel> items;

  CollectionItems() {
    items = [
      CollectionModel(
          imagePath: "https://i.picsum.photos/id/1/5616/3744.jpg?hmac=kKHwwU8s46oNettHKwJ24qOlIAsWN9d2TtsXDoCWWsQ",
          title: "Abstract Art",
          price: 3.4),
      CollectionModel(
          imagePath: "https://i.picsum.photos/id/1/5616/3744.jpg?hmac=kKHwwU8s46oNettHKwJ24qOlIAsWN9d2TtsXDoCWWsQ",
          title: "Abstract Art2",
          price: 3.4),
      CollectionModel(
          imagePath: "https://i.picsum.photos/id/1/5616/3744.jpg?hmac=kKHwwU8s46oNettHKwJ24qOlIAsWN9d2TtsXDoCWWsQ",
          title: "Abstract Art3",
          price: 3.4),
      CollectionModel(
          imagePath: "https://i.picsum.photos/id/1/5616/3744.jpg?hmac=kKHwwU8s46oNettHKwJ24qOlIAsWN9d2TtsXDoCWWsQ",
          title: "Abstract Art4",
          price: 3.4),
    ];
  }
}

class PaddingUtility {
  final paddingBottom = const EdgeInsets.only(bottom: 20);
  final paddingHorizontal = const EdgeInsets.symmetric(horizontal: 20);
  final paddingGeneral = const EdgeInsets.all(15.0);
  final paddingTop = const EdgeInsets.only(top: 20);
}
