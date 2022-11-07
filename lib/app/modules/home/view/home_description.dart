import 'package:search_university/app/model/university.dart';
import 'package:flutter/material.dart';

class HomeDescription extends StatefulWidget {
  final University university;
  const HomeDescription({Key? key, required this.university}) : super(key: key);

  @override
  _HomeDescriptionState createState() => _HomeDescriptionState();
}

class _HomeDescriptionState extends State<HomeDescription> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  '${widget.university.fullName}',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(height: 30),
                Text(
                  'Nome: ${widget.university.name}',
                  style: const TextStyle(fontSize: 15),
                ),
                const SizedBox(height: 20),
                Text(
                  'IBGE: ${widget.university.ibge}',
                  style: const TextStyle(fontSize: 15),
                ),
                const SizedBox(height: 20),
                Text(
                  'Cidade: ${widget.university.city}',
                  style: const TextStyle(fontSize: 15),
                ),
                const SizedBox(height: 20),
                Text(
                  'Unidade Federativa: ${widget.university.uf}',
                  style: const TextStyle(fontSize: 15),
                ),
                const SizedBox(height: 20),
                Text(
                  'CEP: ${widget.university.zipcode}',
                  style: const TextStyle(fontSize: 15),
                ),
                const SizedBox(height: 20),
                Text(
                  'Rua: ${widget.university.street}',
                  style: const TextStyle(fontSize: 15),
                ),
                const SizedBox(height: 20),
                Text(
                  'Número: ${widget.university.number}',
                  style: const TextStyle(fontSize: 15),
                ),
                const SizedBox(height: 20),
                Text(
                  'Bairro: ${widget.university.neighborhood}',
                  style: const TextStyle(fontSize: 15),
                ),
                const SizedBox(height: 20),
                Text(
                  'Telefone: ${widget.university.phone}',
                  style: const TextStyle(fontSize: 15),
                ),
              ],
            ),
          ),
        ),
    );
  }
}
