import 'package:dartz/dartz.dart';
import 'package:forum/core/configs/app_errors.dart';
import 'package:forum/modules/posts/models/post_model.dart';
import 'package:mobx/mobx.dart';
import 'package:forum/modules/posts/repositories/posts_repository.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
part 'posts_editor_controller.g.dart';

class PostsEditorController = _PostsEditorControllerBase
    with _$PostsEditorController;

abstract class _PostsEditorControllerBase with Store {
  final PostsRepository _repository;

  _PostsEditorControllerBase(this._repository);

  @observable
  String? id;

  @action
  void setId(value) => id = value;

  @observable
  String title = '';

  @action
  void setTitle(value) => title = value;

  @observable
  String description = '';

  @action
  void setDescription(value) => description = value;

  @action
  Future<Either<Failure, bool>> save() async {
    final post = PostModel(
      id: id,
      title: title,
      description: description,
      userId: 'WCW4Zfs9Ey',
    );

    if (id == null) {
      return await _repository.createPost(post);
    } else {
      return await _repository.updatePost(post);
    }
  }
}
