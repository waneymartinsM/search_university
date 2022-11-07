import 'package:search_university/app/model/university.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import '../repository/university_repository.dart';
part 'university_api_store.g.dart';

class UniversityApiStore = _UniversityApiStoreBase with _$UniversityApiStore;

abstract class _UniversityApiStoreBase with Store {

  @observable
  bool isLoading = false;

  @observable
  List<University> listUniversity = [];

  @action
  Future getUniversities()async{
    isLoading = true;
    UniversityRepository universityRepository = UniversityRepository(Dio());

    await universityRepository.searchUniversity()
        .then((university) => listUniversity = university);

    if (kDebugMode) {
      print('RESULT');
    }
    if (kDebugMode) {
      print(listUniversity.length);
    }
    isLoading = false;
    //ou
    // listUniversity.addAll(await universityRepository.searchUniversity());
  }

}