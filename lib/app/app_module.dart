import 'package:flutter_modular/flutter_modular.dart';

import 'modules/home/home_module.dart';
import 'modules/home/store/university_api_store.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => UniversityApiStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: HomeModule()),
  ];

}