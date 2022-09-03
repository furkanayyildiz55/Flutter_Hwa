import 'package:flutter/material.dart';
import 'package:flutter_hwa/core/random_image.dart';

class ListTileLearn extends StatelessWidget {
  const ListTileLearn({Key? key}) : super(key: key);
  final ImageUrl = "https://picsum.photos/200/300";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                onTap: () {},
                title: const RandonImage(),
                subtitle: Text("How do you use your card..."),
                leading:   Icon(Icons.money),
                trailing: Icon(Icons.chevron_right),
                //contentPadding: EdgeInsets.zero, //Compenentin paddingini siler. Önemlidir. ThemeData dan da verilebilir. Hamallık önleyici
                //dense: true, //Compenenti olabildiğince sıkıştırır. Paddingleri siler
              ),
            ),
          )
        ],
      ),
    );
  }
}
