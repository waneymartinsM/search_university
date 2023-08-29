import 'package:search_university/app/model/university.dart';
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
  Future getUniversities() async {
    isLoading = true;
    try {
      UniversityRepository repository = UniversityRepository();
      List<University> universities = await repository.searchUniversity();
      listUniversity.addAll(universities);

      if (kDebugMode) {
        print('Resultado: ${listUniversity.length}');
      }
    } catch (e) {
      debugPrint("Ocorreu um erro ao buscar universidades: $e");
    } finally {
      isLoading = false;
    }
  }
}
