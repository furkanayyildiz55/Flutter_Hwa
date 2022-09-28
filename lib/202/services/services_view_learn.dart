import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hwa/202/services/post_model.dart';

class ServicesViewLearn extends StatefulWidget {
  const ServicesViewLearn({Key? key}) : super(key: key);

  @override
  State<ServicesViewLearn> createState() => _ServicesViewLearnState();
}

class _ServicesViewLearnState extends State<ServicesViewLearn> {
  List<PostModel>? _items; //Post Model null olabilir olduğu için ? verdik
  bool _isLoading = false;
  late final Dio _dio;
  final _baseUrl = "https://jsonplaceholder.typicode.com/";

  @override
  void initState() {
    super.initState();
    fetchPostItems(); // İnit State içinde await verilmez
    _dio = Dio(BaseOptions(baseUrl: _baseUrl));
  }

  void changeLoading() {
    _isLoading = !_isLoading;
  }

  void fetchPostItemsAdvance() async {
    changeLoading();
    final response = await _dio.get(
        "posts"); //Dio nesnesinden sürekli oluşturmak yerine sayfa başında oluşturuyoruz...Base url olayı da url nin en çok tekrar eden kısmı

    if (response.statusCode == HttpStatus.ok) {
      //Http isteği başarı bir şekilde geri döndü ise işleme devam ediyoruz
      final _datas = response.data;

      if (_datas is List) {
        //response.data dynamic gözüküyor fatak aslında List ve list özelliklerini görebilmek için sorgulama yapıyoruz
        setState(() {
          _items = _datas.map((e) => PostModel.fromJson(e)).toList();
        });
      }
    }
    changeLoading();
  }

  void fetchPostItems() async {
    changeLoading();
    final response = await Dio().get(
        "https://jsonplaceholder.typicode.com/posts"); //Get Future döndüğünden işlemi await ile asenkron yapıyoruz

    if (response.statusCode == HttpStatus.ok) {
      //Http isteği başarı bir şekilde geri döndü ise işleme devam ediyoruz
      final _datas = response.data;

      if (_datas is List) {
        //response.data dynamic gözüküyor fatak aslında List ve list özelliklerini görebilmek için sorgulama yapıyoruz
        setState(() {
          _items = _datas.map((e) => PostModel.fromJson(e)).toList();
        });
      }
    }
    changeLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          _isLoading ? const CircularProgressIndicator.adaptive() : const SizedBox.shrink()
        ],
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 10),
        itemCount: _items?.length ?? 0, //items null gelebilir olduğu için kontrol yapıyoruz
        itemBuilder: ((context, index) {
          return _postCard(model: _items?[index]);
        }),
      ),
    );
  }
}

class _postCard extends StatelessWidget {
  const _postCard({
    Key? key,
    required PostModel? model,
  })  : _model = model,
        super(key: key);

  final PostModel? _model;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 23),
      child: ListTile(
        title: Text(_model?.title ?? ""),
        subtitle: Text(_model?.body ?? ""),
      ),
    );
  }
}
