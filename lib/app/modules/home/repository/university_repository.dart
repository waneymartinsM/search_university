import 'package:search_university/app/const/const_api.dart';
import 'package:search_university/app/model/university.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';

class UniversityRepository extends Disposable {
  final Dio dio;

  UniversityRepository(this.dio);

  Future<List<University>> searchUniversity() async {
    try{
      final response =
      await dio.get(ConstApi.universityApiUrl);
      return (response.data as List)
          .map((item) => University.fromJson(item))
          .toList();
    } catch (ex){
      debugPrint('Error: $ex');
      return [];
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}