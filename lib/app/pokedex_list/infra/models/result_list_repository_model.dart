import 'dart:convert';

import 'package:pokedex/app/pokedex_list/domain/entities/result_item.dart';
import 'package:pokedex/app/pokedex_list/domain/entities/result_list.dart';
import 'package:pokedex/app/pokedex_list/infra/models/result_item_repository_model.dart';

class ResultListRepositoryModel extends ResultList {
  ResultListRepositoryModel({
    int? count,
    List<ResultItem>? results,
  }) : super(
          count: count,
          results: results,
        );

  factory ResultListRepositoryModel.fromMap(Map<String, dynamic> map) =>
      ResultListRepositoryModel(
        count: map['count'],
        results: map['results'] == null
            ? null
            : map['results']
                .map<ResultItem>(
                    (result) => ResultItemRepositoryModel.fromMap(result))
                .toList(),
      );

  factory ResultListRepositoryModel.fromJson(String json) =>
      ResultListRepositoryModel.fromMap(jsonDecode(json));

  Map<String, dynamic> toMap() => {
        'count': count,
        'results': results == null
            ? null
            : results!
                .map<Map<String, dynamic>>(
                    (result) => (result as ResultItemRepositoryModel).toMap())
                .toList(),
      };

  String toJson() => jsonEncode(toMap());

  @override
  String toString() => toMap().toString();
}
