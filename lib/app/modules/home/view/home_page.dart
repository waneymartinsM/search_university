import 'package:google_fonts/google_fonts.dart';
import 'package:search_university/app/model/university.dart';
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
        title: Text(
          'Buscar Universidade',
          style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600),
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
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Center(
      child: Observer(
        builder: (context) => controller.isLoading
            ? const CircularProgressIndicator()
            : _buildListUniversities(),
      ),
    );
  }

  Widget _buildListUniversities() {
    return ListView.builder(
        itemCount: controller.listUniversity.length,
        itemBuilder: (context, index) {
          return _buildUniversityCard(controller.listUniversity[index]);
        });
  }

  Widget _buildUniversityCard(University university) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, right: 8, left: 8),
      child: Card(
        color: Colors.white,
        elevation: 5,
        child: InkWell(
          splashColor: Colors.pink.withAlpha(30),
          onTap: () {
            Modular.to.pushNamed('/description', arguments: university);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: ListTile(
                  title: Center(
                      child: Text('${university.fullName}',
                          style:
                              GoogleFonts.poppins(fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center)),
                  subtitle: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text('Nome: ${university.name}',
                            style: GoogleFonts.poppins(
                              color: Colors.grey.shade800,
                            )),
                        const SizedBox(height: 8),
                        Text('Cidade: ${university.city}',
                            style: GoogleFonts.poppins(
                              color: Colors.grey.shade800,
                            )),
                        const SizedBox(height: 8),
                        Text('Unidade Federativa: ${university.uf}',
                            style: GoogleFonts.poppins(
                              color: Colors.grey.shade800,
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
