import 'dart:convert';

import 'package:pokedex/app/pokedex_detail/domain/entities/pokemon_type.dart';

class PokemonTypeRepositoryModel extends PokemonType {
  PokemonTypeRepositoryModel({
    int? slot,
    String? type,
  }) : super(
          slot: slot,
          type: type,
        );

  factory PokemonTypeRepositoryModel.fromMap(Map<String, dynamic> map) =>
      PokemonTypeRepositoryModel(
        slot: map['slot'],
        type: map['type']?['name'],
      );

  factory PokemonTypeRepositoryModel.fromJson(String json) =>
      PokemonTypeRepositoryModel.fromMap(jsonDecode(json));

  Map<String, dynamic> toMap() => {
        'slot': slot,
        'type': {'name': type},
      };

  String toJson() => jsonEncode(toMap());

  @override
  String toString() => toMap().toString();
}
