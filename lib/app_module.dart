import 'package:flutter_modular/flutter_modular.dart';
import 'package:forum/modules/home/home_module.dart';
import 'package:forum/modules/reset/reset_module.dart';

import 'modules/login/login_module.dart';
import 'modules/register/register_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/login', module: LoginModule()),
    ModuleRoute('/register', module: RegisterModule()),
    ModuleRoute('/reset', module: ResetModule()),
    ModuleRoute('/home', module: HomeModule()),
  ];
}
