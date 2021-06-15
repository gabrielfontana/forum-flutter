// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'posts_detail_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PostsDetailController on _PostsControllerBase, Store {
  final _$commentsListAtom = Atom(name: '_PostsControllerBase.commentsList');

  @override
  ObservableList<CommentModel> get commentsList {
    _$commentsListAtom.reportRead();
    return super.commentsList;
  }

  @override
  set commentsList(ObservableList<CommentModel> value) {
    _$commentsListAtom.reportWrite(value, super.commentsList, () {
      super.commentsList = value;
    });
  }

  final _$commentAtom = Atom(name: '_PostsControllerBase.comment');

  @override
  String get comment {
    _$commentAtom.reportRead();
    return super.comment;
  }

  @override
  set comment(String value) {
    _$commentAtom.reportWrite(value, super.comment, () {
      super.comment = value;
    });
  }

  final _$createCommentAsyncAction =
      AsyncAction('_PostsControllerBase.createComment');

  @override
  Future<dynamic> createComment() {
    return _$createCommentAsyncAction.run(() => super.createComment());
  }

  final _$fetchCommentsByPostIdAsyncAction =
      AsyncAction('_PostsControllerBase.fetchCommentsByPostId');

  @override
  Future<dynamic> fetchCommentsByPostId() {
    return _$fetchCommentsByPostIdAsyncAction
        .run(() => super.fetchCommentsByPostId());
  }

  final _$_PostsControllerBaseActionController =
      ActionController(name: '_PostsControllerBase');

  @override
  void setComment(dynamic value) {
    final _$actionInfo = _$_PostsControllerBaseActionController.startAction(
        name: '_PostsControllerBase.setComment');
    try {
      return super.setComment(value);
    } finally {
      _$_PostsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
commentsList: ${commentsList},
comment: ${comment}
    ''';
  }
}
