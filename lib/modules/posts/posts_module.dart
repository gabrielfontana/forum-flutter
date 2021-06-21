import 'package:flutter_modular/flutter_modular.dart';
import 'package:forum/modules/posts/controllers/posts_controller.dart';
import 'package:forum/modules/posts/pages/posts_detail_page.dart';
import 'package:forum/modules/posts/pages/posts_editor_page.dart';
import 'package:forum/modules/posts/pages/posts_page.dart';
import 'package:forum/modules/posts/repositories/posts_repository.dart';
import 'controllers/posts_detail_controller.dart';
import 'controllers/posts_editor_controller.dart';

class PostsModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => PostsRepository()),
    Bind((i) => PostsController(i())),
    Bind((i) => PostsEditorController(i())),
    Bind((i) => PostsDetailController(i(), i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, __) => PostsPage()),
    ChildRoute('/editor', child: (_, __) => PostsEditorPage()),
    ChildRoute(
      '/detail',
      child: (_, args) => PostsDetailPage(
        post: args.data,
      ),
    ),
  ];
}
