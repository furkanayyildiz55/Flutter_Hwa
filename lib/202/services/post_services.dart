import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_hwa/202/services/comment_model.dart';
import 'package:flutter_hwa/202/services/post_model.dart';

//Classı interface ile oluşturmak test edilebilirlik açısından önemli
//
abstract class IPostServices {
  Future<bool> _addItemsToService(PostModel postModel);
  Future<bool> _putsItemToService(PostModel postModel, int id); //Güncellemek Gibi
  Future<bool> _deleteItemToService(int id);

  Future<List<PostModel>?> fetchPostItemsAdvance(); //Servisten bilgileri getir
  Future<List<CommentModel>?> fetchRelatedCommentsWithPostId(int postId);
}

class PostServices implements IPostServices {
  late final Dio _dio;
  PostServices() : _dio = Dio(BaseOptions(baseUrl: "https://jsonplaceholder.typicode.com/"));

  @override
  Future<bool> _addItemsToService(PostModel postModel) async {
    try {
      final response = await _dio.post(_postServicesPaths.posts.name, data: postModel);

      return response.statusCode == HttpStatus.created;
    } on DioError catch (error) {
      _ShowDebug.showDioError(error, this);
      return false;
    }
  }

  @override
  Future<bool> _putsItemToService(PostModel postModel, int id) async {
    try {
      final response = await _dio.put("${_postServicesPaths.posts.name}/$id", data: postModel);

      return response.statusCode == HttpStatus.ok;
    } on DioError catch (error) {
      _ShowDebug.showDioError(error, this);
      return false;
    }
  }

  @override
  Future<bool> _deleteItemToService(int id) async {
    try {
      final response = await _dio.put("${_postServicesPaths.posts.name}/$id");

      return response.statusCode == HttpStatus.ok;
    } on DioError catch (error) {
      _ShowDebug.showDioError(error, this);
      return false;
    }
  }

  @override
  Future<List<PostModel>?> fetchPostItemsAdvance() async {
    //Liste gelecek fakat null data da gelebilir anlamında
    try {
      final response = await _dio.get(_postServicesPaths.posts
          .name); //Dio nesnesinden sürekli oluşturmak yerine sayfa başında oluşturuyoruz...Base url olayı da url nin en çok tekrar eden kısmı

      if (response.statusCode == HttpStatus.ok) {
        //Http isteği başarı bir şekilde geri döndü ise işleme devam ediyoruz
        final _datas = response.data;

        if (_datas is List) {
          //response.data dynamic gözüküyor fatak aslında List ve list özelliklerini görebilmek için sorgulama yapıyoruz
          return _datas.map((e) => PostModel.fromJson(e)).toList();
        }
      }
    } on DioError catch (error) {
      _ShowDebug.showDioError(error, this);
    }
    return null;
  }

  @override
  Future<List<CommentModel>?> fetchRelatedCommentsWithPostId(int postId) async {
    try {
      final response = await _dio.get(_postServicesPaths.comments.name,
          queryParameters: {_fetchQeryPaths.postId.name: postId});

      if (response.statusCode == HttpStatus.ok) {
        final _datas = response.data;

        if (_datas is List) {
          return _datas.map((e) => CommentModel.fromJson(e)).toList();
        }
      }
    } on DioError catch (error) {
      _ShowDebug.showDioError(error, this);
    }
  }
}

enum _postServicesPaths { posts, comments }
enum _fetchQeryPaths { postId }

class _ShowDebug {
  static void showDioError<T>(DioError error, T type) {
    if (kDebugMode) {
      print(error.message);
      print(T);
    }
  }
}
