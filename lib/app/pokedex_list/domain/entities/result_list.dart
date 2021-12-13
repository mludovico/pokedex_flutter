import 'package:pokedex/app/pokedex_list/domain/entities/result_item.dart';

class ResultList {
  int? count;
  List<ResultItem>? results;

  ResultList({this.count, this.results});

  ResultList copyWith({int? count, List<ResultItem>? results}) => ResultList(
        count: count ?? this.count,
        results: results ?? this.results,
      );
}
