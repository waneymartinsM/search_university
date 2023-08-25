import 'package:search_university/app/modules/home/store/university_api_store.dart';
import 'package:search_university/app/modules/home/view/home_description.dart';
import 'package:search_university/app/modules/home/view/home_page.dart';
import 'package:search_university/app/modules/home/view/search_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
 
class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => UniversityApiStore())
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const HomePage()),
    ChildRoute('/description', child: (_, args) => HomeDescription(university: args.data)),
    ChildRoute('/search', child: (_, args) => SearchPage(universities: args.data)),
  ];
  //static Inject get to => Inject<HomeModule>.of();
}