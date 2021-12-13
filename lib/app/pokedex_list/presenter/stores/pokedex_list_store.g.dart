// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokedex_list_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PokedexListStore on _PokedexListStore, Store {
  Computed<List<ResultItem>>? _$listComputed;

  @override
  List<ResultItem> get list =>
      (_$listComputed ??= Computed<List<ResultItem>>(() => super.list,
              name: '_PokedexListStore.list'))
          .value;
  Computed<int>? _$listLengthComputed;

  @override
  int get listLength =>
      (_$listLengthComputed ??= Computed<int>(() => super.listLength,
              name: '_PokedexListStore.listLength'))
          .value;

  final _$loadingAtom = Atom(name: '_PokedexListStore.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$errorAtom = Atom(name: '_PokedexListStore.error');

  @override
  String? get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String? value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  final _$searchTextAtom = Atom(name: '_PokedexListStore.searchText');

  @override
  String get searchText {
    _$searchTextAtom.reportRead();
    return super.searchText;
  }

  @override
  set searchText(String value) {
    _$searchTextAtom.reportWrite(value, super.searchText, () {
      super.searchText = value;
    });
  }

  final _$searchEnabledAtom = Atom(name: '_PokedexListStore.searchEnabled');

  @override
  bool get searchEnabled {
    _$searchEnabledAtom.reportRead();
    return super.searchEnabled;
  }

  @override
  set searchEnabled(bool value) {
    _$searchEnabledAtom.reportWrite(value, super.searchEnabled, () {
      super.searchEnabled = value;
    });
  }

  final _$initListAsyncAction = AsyncAction('_PokedexListStore.initList');

  @override
  Future<void> initList() {
    return _$initListAsyncAction.run(() => super.initList());
  }

  final _$_PokedexListStoreActionController =
      ActionController(name: '_PokedexListStore');

  @override
  void search(String text) {
    final _$actionInfo = _$_PokedexListStoreActionController.startAction(
        name: '_PokedexListStore.search');
    try {
      return super.search(text);
    } finally {
      _$_PokedexListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleSearchBar() {
    final _$actionInfo = _$_PokedexListStoreActionController.startAction(
        name: '_PokedexListStore.toggleSearchBar');
    try {
      return super.toggleSearchBar();
    } finally {
      _$_PokedexListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
error: ${error},
searchText: ${searchText},
searchEnabled: ${searchEnabled},
list: ${list},
listLength: ${listLength}
    ''';
  }
}
