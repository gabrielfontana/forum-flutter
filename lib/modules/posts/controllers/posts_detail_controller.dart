import 'package:forum/modules/posts/models/comment_model.dart';
import 'package:mobx/mobx.dart';
import 'package:forum/modules/posts/repositories/posts_repository.dart';
part 'posts_detail_controller.g.dart';

class PostsDetailController = _PostsControllerBase with _$PostsDetailController;

abstract class _PostsControllerBase with Store {
  final PostsRepository _repository;

  _PostsControllerBase(this._repository);

  @observable
  ObservableList<CommentModel> commentsList = ObservableList.of([]);

  @observable
  String comment = '';

  @action
  void setComment(value) => comment = value;

  @action
  Future createComment() async {
    comment = '';
  }

  @action
  Future fetchCommentsByPostId() async {}
}
