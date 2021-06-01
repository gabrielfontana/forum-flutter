import 'package:flutter_modular/flutter_modular.dart';
import 'package:forum/modules/register/pages/register_page.dart';
import 'package:forum/modules/register/repositories/register_repository.dart';

import 'controllers/register_controller.dart';

class RegisterModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => RegisterRepository()),
    Bind((i) => RegisterController(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, __) => RegisterPage()),
  ];
}
