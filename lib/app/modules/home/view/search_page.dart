import 'package:search_university/app/model/university.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SearchPage extends StatefulWidget {
  final List<University> universities;
  const SearchPage({Key? key, required this.universities}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final searchController = TextEditingController();

  List filterUniversity = [];

  searchUniversity(String text) {
    filterUniversity.clear();
    for (var element in widget.universities) {
      String filter = element.fullName!.toLowerCase()
          + element.name!.toLowerCase()
          + element.city!.toLowerCase()
          + element.uf!.toLowerCase();

      if (filter.contains(text.toLowerCase())) {
        filterUniversity.add(element);
      }
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    filterUniversity.addAll(widget.universities);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: searchController,
                cursorColor: Colors.white,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18
                ),
                onChanged: (text) {
                  searchUniversity(text);
                },
              ),
            ),
            IconButton(
                onPressed: () {
                  searchUniversity(searchController.text);
                },
                icon: const Icon(Icons.search))
          ],
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: filterUniversity.length,
          itemBuilder: (_, index) {
            final university = filterUniversity[index];
            return InkWell(
              onTap: (){
                Modular.to.pushNamed('/description',
                    arguments: filterUniversity[index]);
              },
              child: ListTile(
                title: Text(university.fullName ?? ''),
                subtitle: Text(university.city ?? ''),
              ),
            );
          }),
    );
  }
}
