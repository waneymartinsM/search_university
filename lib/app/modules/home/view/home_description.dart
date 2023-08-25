import 'package:google_fonts/google_fonts.dart';
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
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    final university = widget.university;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              '${university.fullName}',
              style:
                  GoogleFonts.syne(fontWeight: FontWeight.bold, fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            _buildText('Nome', university.name.toString()),
            _buildText('IBGE', university.ibge.toString()),
            _buildText('Cidade', university.city.toString()),
            _buildText('Unidade Federativa', university.uf.toString()),
            _buildText('CEP', formatCep(university.zipcode.toString())),
            _buildText('Rua', university.street.toString()),
            _buildText('Número', university.number.toString()),
            _buildText('Bairro', university.neighborhood.toString()),
            _buildText('Telefone', university.phone.toString()),
          ],
        ),
      ),
    );
  }

  Widget _buildText(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Text(
        '$label: $value',
        style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: 16),
        textAlign: TextAlign.center,
      ),
    );
  }

  String formatCep(String cep) {
    if (cep.length == 8) {
      return "${cep.substring(0, 5)}-${cep.substring(5)}";
    }
    return cep;
  }
}
