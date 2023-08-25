// import 'package:search_university/app/const/const_api.dart';
// import 'package:search_university/app/model/university.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter_modular/flutter_modular.dart';
//
// class UniversityRepository extends Disposable {
//   final Dio dio;
//
//   UniversityRepository(this.dio);
//
//   Future<List<University>> searchUniversity() async {
//     try {
//       final response = await dio.get(ConstApi.universityApiUrl);
//       return (response.data as List)
//           .map((item) => University.fromJson(item))
//           .toList();
//     } catch (ex) {
//       debugPrint('Error: $ex');
//       return [];
//     }
//   }
//
//   @override
//   void dispose() {
//     // TODO: implement dispose
//   }
// }

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:search_university/app/const/const_api.dart';
import 'package:search_university/app/model/university.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';

class UniversityRepository extends Disposable {
  final http.Client _httpClient = http.Client();

  Future<List<University>> searchUniversity() async {
    try {
      final response = await http.get(Uri.parse(ConstApi.universityApiUrl));

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        return data.map((item) => University.fromJson(item)).toList();
      } else {
        throw Exception(
            "Falha na solicitação com status: ${response.statusCode}");
      }
    } catch (ex) {
      debugPrint('Error: $ex');
      throw Exception("Ocorreu um erro: $ex");
    }
  }

  @override
  void dispose() {
    _httpClient.close();
  }
}
