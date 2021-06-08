import 'package:forum/modules/posts/models/post_model.dart';
import 'package:mobx/mobx.dart';

import 'package:forum/modules/posts/repositories/posts_repository.dart';

part 'posts_controller.g.dart';

class PostsController = _PostsControllerBase with _$PostsController;

abstract class _PostsControllerBase with Store {
  final PostsRepository _repository;

  _PostsControllerBase(this._repository);

  @observable
  ObservableList<PostModel> postList = ObservableList.of([]);

  @computed
  int get length => postList.length;

  @action
  Future fetch() async {
    final result = await _repository.readPosts();
    result.fold(
      (_) => postList.clear(),
      (data) => postList = data.asObservable(),
    );
  }
}
