import 'package:flutter_modular/flutter_modular.dart';
import 'package:forum/modules/profile/pages/profile_page.dart';

class ProfileModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, __) => ProfilePage()),
  ];
}
