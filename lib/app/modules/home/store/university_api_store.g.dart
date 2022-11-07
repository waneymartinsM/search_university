// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'university_api_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UniversityApiStore on _UniversityApiStoreBase, Store {
  late final _$isLoadingAtom =
      Atom(name: '_UniversityApiStoreBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$listUniversityAtom =
      Atom(name: '_UniversityApiStoreBase.listUniversity', context: context);

  @override
  List<University> get listUniversity {
    _$listUniversityAtom.reportRead();
    return super.listUniversity;
  }

  @override
  set listUniversity(List<University> value) {
    _$listUniversityAtom.reportWrite(value, super.listUniversity, () {
      super.listUniversity = value;
    });
  }

  late final _$getUniversitiesAsyncAction =
      AsyncAction('_UniversityApiStoreBase.getUniversities', context: context);

  @override
  Future<dynamic> getUniversities() {
    return _$getUniversitiesAsyncAction.run(() => super.getUniversities());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
listUniversity: ${listUniversity}
    ''';
  }
}
