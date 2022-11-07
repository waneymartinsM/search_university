import 'package:search_university/app/modules/home/store/university_api_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Modular.get<UniversityApiStore>();

  @override
  void initState() {
    super.initState();
    controller.getUniversities();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Buscar Universidade',
        ),
        actions: [
          IconButton(
            onPressed: () {
              Modular.to.pushNamed(
                '/search',
                arguments: controller.listUniversity,
              );
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: Center(
        child: Observer(
          builder: (context) => controller.isLoading
              ? const CircularProgressIndicator()
              : ListView.builder(
                  itemCount: controller.listUniversity.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.white,
                      elevation: 5,
                      child: InkWell(
                        splashColor: Colors.pink.withAlpha(30),
                        onTap: () {
                          Modular.to.pushNamed('/description',
                              arguments: controller.listUniversity[index]);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: ListTile(
                                title: Text(
                                    '${controller.listUniversity[index].fullName}'),
                                subtitle: Column(
                                  children: [
                                    Text(
                                        'Nome: ${controller.listUniversity[index].name}'),
                                    Text(
                                        'Cidade: ${controller.listUniversity[index].city}'),
                                    Text(
                                        'Unidade Federativa: ${controller.listUniversity[index].uf}'),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
        ),
      ),
    );
  }
}
