import 'dart:convert';

import 'package:pokedex/app/pokedex_list/domain/entities/result_item.dart';

class ResultItemRepositoryModel extends ResultItem {
  ResultItemRepositoryModel({String? name, String? url})
      : super(name: name, url: url);

  factory ResultItemRepositoryModel.fromMap(Map<String, dynamic> map) =>
      ResultItemRepositoryModel(
        name: map['name'],
        url: map['url'],
      );

  factory ResultItemRepositoryModel.fromJson(String json) =>
      ResultItemRepositoryModel.fromMap(jsonDecode(json));

  Map<String, dynamic> toMap() => {
        'name': name,
        'url': url,
      };

  String toJson() => jsonEncode(toMap());

  @override
  String toString() => toMap().toString();
}
