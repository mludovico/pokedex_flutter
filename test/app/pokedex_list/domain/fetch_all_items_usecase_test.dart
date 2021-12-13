import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pokedex/app/pokedex_list/domain/usecases/fetch_all_items_usecase_impl.dart';
import 'package:pokedex/app/pokedex_list/infra/models/result_list_repository_model.dart';
import 'package:pokedex/app/shared/infra/errors.dart';

import '../../../util/pokeapi_list_data.dart';
import '../pokedex_list.mocks.dart';

void main() {
  final repository = MockPokedexListRepository();
  final useCase = FetchAllItemsUsecaseImpl(repository);
  final results = ResultListRepositoryModel.fromMap(POKEAPI_LIST_DATA);

  group('Test FetchAllItemsUseCase with mocked repository', () {
    test('Should return a List<ResultItem>', () async {
      when(repository.fetchAllItems()).thenAnswer((_) async => results);
      final future = useCase();
      expect(future, completes);
      final result = await future;
      expect(result, isNotNull);
      expect(result, isNotEmpty);
      expect(result, isA<List>());
    });

    test('Should return the same Future.error returned from repo', () async {
      when(repository.fetchAllItems())
          .thenAnswer((_) async => Future.error('specified_error'));
      final future = useCase();
      expect(future, throwsA('specified_error'));
    });

    test('Should return a message when repo throws ParserError', () async {
      when(repository.fetchAllItems()).thenThrow(ParserError());
      final future = useCase();
      expect(future, throwsA(PARSING_FAILURE));
    });
  });
}
