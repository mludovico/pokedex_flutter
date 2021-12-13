import 'package:pokedex/app/pokedex_list/domain/entities/result_item.dart';
import 'package:pokedex/app/pokedex_list/domain/repositories/pokedex_list_repository.dart';
import 'package:pokedex/app/pokedex_list/presenter/usecases/pokedex_list_usecases.dart';
import 'package:pokedex/app/shared/infra/errors.dart';

const PARSING_FAILURE = 'Opa! Não foi possível exibir os resultados';

class FetchAllItemsUsecaseImpl implements FetchALlItemsUsecase {
  final PokedexListRepository _repository;

  FetchAllItemsUsecaseImpl(this._repository);

  @override
  Future<List<ResultItem>> call() async {
    try {
      final list = await _repository.fetchAllItems();
      return list.results ?? [];
    } on ParserError {
      return Future.error(PARSING_FAILURE);
    }
  }
}
