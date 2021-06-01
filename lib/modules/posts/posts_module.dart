import 'package:flutter_modular/flutter_modular.dart';
import 'package:forum/modules/posts/pages/posts_page.dart';

class PostsModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, __) => PostsPage()),
  ];
}