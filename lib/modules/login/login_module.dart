import 'package:flutter_modular/flutter_modular.dart';
import 'package:forum/modules/login/controllers/login_controller.dart';
import 'package:forum/modules/login/pages/login_page.dart';
import 'package:forum/modules/login/repositories/login_repository.dart';

class LoginModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => LoginRepository()),
    Bind((i) => LoginController(i(), i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, __) => LoginPage()),
  ];
}
