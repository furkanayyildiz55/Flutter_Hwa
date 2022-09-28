//Bir sınıf içindeki herhangi bir değer initiliaze edilmeli

// ? Değişken null gelebilir anlamında
class PostModel1 {
  int? userId;
  int? id;
  String? title;
  String? body;
}

//Construtor ile initialize edilecek
class PostModel2 {
  int userId;
  int id;
  String title;
  String body;

  PostModel2(this.userId, this.id, this.title, this.body);
}

//Değişkenler sadece constructor ile initialize edilecek ve değişmeyecek
class PostModel3 {
  final int userId;
  final int id;
  final String title;
  final String body;

  PostModel3(this.userId, this.id, this.title, this.body);
}

//Aynı Örnek 3 gibi ama parametreler named şeklinde gelecek
class PostModel4 {
  final int userId;
  final int id;
  final String title;
  final String body;

  PostModel4({required this.userId, required this.id, required this.title, required this.body});
}

class PostModel5 {
  final int _userId;
  final int _id;
  final String _title;
  final String _body;

  int get userId {
    return _userId;
  }

  PostModel5({required int userId, required int id, required String title, required String body})
      : _userId = userId,
        _id = id,
        _title = title,
        _body = body;
}

// Late değer sonradan gelecek anlamında
//Yani değer sadece construnctor anında ve sonradan gelecek anlamında. Öbür zamanlarda verirsel CRASH
class PostModel6 {
  late final int _userId;
  late final int _id;
  late final String _title;
  late final String _body;

  PostModel6({required int userId, required int id, required String title, required String body}) {
    _userId = userId;
    _id = id;
    _title = title;
    _body = body;
  }
}

//Requared değerler ekleyebiliyoruz
class PostModel7 {
  int _userId = 0;
  int _id = 0;
  String _title = "";
  String _body = "";

  PostModel7({required int userId, required int id, required String title, required String body}) {
    _userId = userId;
    _id = id;
    _title = title;
    _body = body;
  }
}

//Data servisten geliyorsa en iyi yöntem
class PostModel8 {
  final int? userId;
  final int? id;
  final String? title;
  String? body;

  PostModel8({this.userId, this.id, this.title, this.body});

  void updateBody(String? data) {
    if (data != null && data.isNotEmpty) {
      body = data;
    }
  }

  PostModel8 copyWith({
    int? userId,
    int? id,
    String? title,
    String? body,
  }) {
    return PostModel8(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }
}
