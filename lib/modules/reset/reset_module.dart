import 'package:flutter_modular/flutter_modular.dart';
import 'package:forum/modules/reset/controllers/reset_controller.dart';
import 'package:forum/modules/reset/pages/reset_page.dart';
import 'package:forum/modules/reset/repositories/reset_repository.dart';

class ResetModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => ResetRepository()),
    Bind((i) => ResetController(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, __) => ResetPage()),
  ];
}
