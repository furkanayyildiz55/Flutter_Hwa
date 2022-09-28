import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hwa/202/services/post_model.dart';

class ServicesPostViewLearn extends StatefulWidget {
  const ServicesPostViewLearn({Key? key}) : super(key: key);

  @override
  State<ServicesPostViewLearn> createState() => _ServicesViewLearnState();
}

class _ServicesViewLearnState extends State<ServicesPostViewLearn> {
  bool _isLoading = false;
  late final Dio _dio;
  final _baseUrl = "https://jsonplaceholder.typicode.com/";
  String name = "İşlem Yok";

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _dio = Dio(BaseOptions(baseUrl: _baseUrl));
  }

  void changeLoading() {
    _isLoading = !_isLoading;
  }

  void _addItemsToService(PostModel postModel) async {
    changeLoading();

    final response = await _dio.post("posts", data: postModel);

    if (response.statusCode == HttpStatus.created) {
      setState(() {
        name = "Başarılı";
      });
    }
    changeLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(name),
          actions: [
            _isLoading ? const CircularProgressIndicator.adaptive() : const SizedBox.shrink()
          ],
        ),
        body: Column(
          children: [
            TextField(
              controller: _titleController,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextField(
              textInputAction: TextInputAction.next,
              controller: _bodyController,
              decoration: InputDecoration(labelText: 'Body'),
            ),
            TextField(
              controller: _userController,
              autofillHints: [AutofillHints.creditCardNumber],
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'UserId'),
            ),
            TextButton(
                onPressed: _isLoading
                    ? null
                    : () {
                        if (_bodyController.text.isNotEmpty &&
                            _titleController.text.isNotEmpty &&
                            _userController.text.isNotEmpty) {
                          final model = PostModel(
                              body: _bodyController.text,
                              title: _titleController.text,
                              userId: int.tryParse(_userController.text));
                          _addItemsToService(model);
                        }
                      },
                child: Text("Send"))
          ],
        ));
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
