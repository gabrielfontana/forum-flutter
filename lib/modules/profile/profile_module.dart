import 'package:flutter_modular/flutter_modular.dart';
import 'package:forum/modules/profile/controlles/profile.controller.dart';
import 'package:forum/modules/profile/pages/profile_page.dart';
import 'package:forum/modules/profile/repositories/profile_repository.dart';

class ProfileModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => ProfileRepository()),
    Bind((i) => ProfileController(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, __) => ProfilePage()),
  ];
}
