import 'package:flutter_modular/flutter_modular.dart';
import 'package:forum/modules/home/controllers/home_controller.dart';
import 'package:forum/modules/home/pages/home_page.dart';
import 'package:forum/modules/posts/posts_module.dart';
import 'package:forum/modules/profile/profile_module.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => HomeController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, __) => HomePage(),
      children: [
        ModuleRoute('/posts', module: PostsModule()),
        ModuleRoute('/profile', module: ProfileModule()),
      ],
    ),
  ];
}
