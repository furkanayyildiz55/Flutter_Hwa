import 'package:flutter/material.dart';

class ListViewBuilderLearn extends StatefulWidget {
  const ListViewBuilderLearn({Key? key}) : super(key: key);

  @override
  State<ListViewBuilderLearn> createState() => _ListViewBuilderLearnState();
}
//İnternetten data çektiğimiz durumda kimi data etken kimi dat ageç gelebilir bu durumda builde erken gelen datayı hemen çizmeye başlar ve
//fazla gereksiz bir çizimin yanı sıra ekranda karmaşa meydana gelir. Fakat coulmn değerini elle verirsek
//gereksiz liste çiziminin önüne geçmiş oluruz

class _ListViewBuilderLearnState extends State<ListViewBuilderLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: ListView.separated(
            itemBuilder: (context, index) {
              return SizedBox(
                height: 200,
                child: Column(
                  children: [
                    Expanded(child: Image.network("https://picsum.photos/200")),
                    Text("$index"),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const Divider(
                color: Colors.black,
                height: 8,
              );
            },
            itemCount: 15));
  }
}
