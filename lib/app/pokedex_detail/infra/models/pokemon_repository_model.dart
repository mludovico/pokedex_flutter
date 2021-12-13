import 'dart:convert';

import 'package:pokedex/app/pokedex_detail/domain/entities/pokemon.dart';
import 'package:pokedex/app/pokedex_detail/infra/models/pokemon_type_repository_model.dart';
import 'package:pokedex/app/pokedex_detail/infra/models/sprites_repository_model.dart';
import 'package:pokedex/helpers/extensions.dart';

class PokemonRepositoryModel extends Pokemon {
  PokemonRepositoryModel({
    int? id,
    String? name,
    int? height,
    int? weight,
    List<PokemonTypeRepositoryModel>? types,
    SpritesRepositoryModel? sprites,
  }) : super(
          id: id,
          name: name,
          height: height,
          weight: weight,
          types: types,
          sprites: sprites,
        );

  factory PokemonRepositoryModel.fromMap(Map<String, dynamic> map) =>
      PokemonRepositoryModel(
        id: map['id'],
        name: map['name'] == null ? null : (map['name'] as String).capitalize(),
        height: map['height'],
        weight: map['weight'],
        types: map['types'] == null
            ? null
            : map['types']
                .map<PokemonTypeRepositoryModel>(
                    (type) => PokemonTypeRepositoryModel.fromMap(type))
                .toList(),
        sprites: map['sprites'] == null
            ? null
            : SpritesRepositoryModel.fromMap(map['sprites']),
      );

  factory PokemonRepositoryModel.fromJson(String json) =>
      PokemonRepositoryModel.fromMap(jsonDecode(json));

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'height': height,
        'weight': weight,
        'types': types == null
            ? null
            : types!
                .map((type) => (type as PokemonTypeRepositoryModel).toMap())
                .toList(),
        'sprites': sprites == null
            ? null
            : (sprites as SpritesRepositoryModel).toMap(),
      };

  String toJson() => jsonEncode(toMap());

  @override
  String toString() => toMap().toString();
}
