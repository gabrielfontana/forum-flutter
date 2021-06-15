import 'package:forum/core/global/user.dart';
import 'package:mobx/mobx.dart';

import 'package:forum/modules/posts/models/comment_model.dart';
import 'package:forum/modules/posts/models/post_model.dart';
import 'package:forum/modules/posts/repositories/posts_repository.dart';

part 'posts_detail_controller.g.dart';

class PostsDetailController = _PostsControllerBase with _$PostsDetailController;

abstract class _PostsControllerBase with Store {
  final PostsRepository _repository;
  final User _user;

  _PostsControllerBase(
    this._repository,
    this._user,
  );

  @observable
  ObservableList<CommentModel> commentsList = ObservableList.of([]);

  @observable
  String comment = '';

  @action
  void setComment(value) => comment = value;

  @action
  Future createComment() async {
    final commentModel = CommentModel(
      description: comment,
      userId: _user.objectId,
      postId: post!.id!,
    );
    await _repository.createComment(commentModel);
    comment = '';
  }

  @observable
  PostModel? post;

  @action
  void setPost(value) => post = value;

  @action
  Future incrementViews() async {
    await _repository.incrementPostView(post!);
  }

  @action
  Future fetchCommentsByPostId() async {}
}
