import 'package:flutter_modular/flutter_modular.dart';
import 'package:forum/modules/posts/controllers/posts_controller.dart';
import 'package:forum/modules/posts/pages/posts_page.dart';
import 'package:forum/modules/posts/repositories/posts_repository.dart';

class PostsModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => PostsRepository()),
    Bind((i) => PostsController(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, __) => PostsPage()),
  ];
}
