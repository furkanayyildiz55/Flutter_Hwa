import 'package:flutter/material.dart';
import 'package:flutter_hwa/202/model_learn.dart';

class ModelLearView extends StatefulWidget {
  const ModelLearView({Key? key}) : super(key: key);

  @override
  State<ModelLearView> createState() => _ModelLearViewState();
}

class _ModelLearViewState extends State<ModelLearView> {
  var user9 = PostModel8(
      body: " denemebody"); //final yerine var yapınca değişebilir bir property olmuş oldu

  @override
  void initState() {
    super.initState();
    final user1 = PostModel1();
    user1.userId = 1;
    user1.title = " ";

    final user2 = PostModel2(1, 2, "title", "body");
    user2.body = "";

    final user3 = PostModel3(1, 2, "title", "body");
    //user3.body = "";

    final user4 = PostModel4(userId: 1, id: 2, title: " title", body: " body");
    //user4.body = "";

    final user5 = PostModel5(userId: 1, id: 2, title: "title", body: "body");
    user5.userId;

    final user6 = PostModel6(userId: 1, id: 2, title: "title", body: "body");

    final user7 = PostModel7(userId: 1, id: 2, title: "title", body: "body");

    final user8 = PostModel8(userId: 1, id: 2, title: " title", body: " body");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (() {
        setState(() {});
        user9 = user9.copyWith(title: "Deneme");
        user9.updateBody("BodyUptada");
      })),
      appBar: AppBar(title: Text(user9.body ?? "Not Has Any Data")),
    );
  }
}
