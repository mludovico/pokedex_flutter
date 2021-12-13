import 'package:get_it/get_it.dart';
import 'package:pokedex/app/pokedex_list/domain/entities/result_item.dart';
import 'package:pokedex/app/pokedex_list/presenter/usecases/pokedex_list_usecases.dart';
import 'package:mobx/mobx.dart';

part 'pokedex_list_store.g.dart';

class PokedexListStore = _PokedexListStore with _$PokedexListStore;

abstract class _PokedexListStore with Store {
  _PokedexListStore() {
    initList();
  }

  @observable
  bool loading = false;

  @observable
  String? error;

  @observable
  String searchText = '';

  @action
  void search(String text) => searchText = text;

  ObservableList<ResultItem> _list = ObservableList<ResultItem>();

  @computed
  List<ResultItem> get list {
    if (searchText.isNotEmpty) {
      return _list
          .where((element) =>
              element.name?.toLowerCase().contains(searchText.toLowerCase()) ??
              false)
          .toList();
    } else {
      return _list;
    }
  }

  @computed
  int get listLength => _list.length;

  ObservableList<int> caughtList = ObservableList<int>();

  @action
  Future<void> initList() async {
    loading = true;
    final fetchAllItemsUseCase = GetIt.I<FetchALlItemsUsecase>();
    final fetchCaughtUseCase = GetIt.I<FetchCaughtPokemonsUsecase>();
    try {
      final retrievedList = await fetchAllItemsUseCase();
      final storedCaughtList = await fetchCaughtUseCase();
      print('Retrieved list: $retrievedList');
      _list.clear();
      _list.addAll(retrievedList);
      caughtList.clear();
      caughtList.addAll(storedCaughtList);
      error = null;
    } catch (e) {
      error = e.toString();
    }
    loading = false;
  }

  @observable
  bool searchEnabled = false;

  @action
  void toggleSearchBar() => searchEnabled = !searchEnabled;
}
