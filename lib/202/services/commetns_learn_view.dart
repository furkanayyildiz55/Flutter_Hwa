import 'package:flutter/material.dart';
import 'package:flutter_hwa/202/services/comment_model.dart';
import 'package:flutter_hwa/202/services/post_services.dart';

class CommentsLearnView extends StatefulWidget {
  const CommentsLearnView({Key? key, this.postId}) : super(key: key);

  final int? postId;

  @override
  State<CommentsLearnView> createState() => _CommentsLearnViewState();
}

class _CommentsLearnViewState extends State<CommentsLearnView> {
  late final IPostServices postServices;
  bool _isLoading = false;
  List<CommentModel>? _commentrItem;

  @override
  void initState() {
    super.initState();
    postServices = PostServices();
    fetchItemsWithId(widget.postId ?? 0);
  }

  void fetchItemsWithId(int postId) async {
    changeLoading();
    _commentrItem = await postServices.fetchRelatedCommentsWithPostId(postId);
    changeLoading();
  }

  void changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
          itemCount: _commentrItem?.length ?? 0,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: Text(_commentrItem?[index].email ?? ""),
            );
          }),
    );
  }
}
