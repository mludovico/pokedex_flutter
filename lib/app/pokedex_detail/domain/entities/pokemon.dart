import 'package:pokedex/app/pokedex_detail/domain/entities/pokemon_type.dart';
import 'package:pokedex/app/pokedex_detail/domain/entities/sprites.dart';

class Pokemon {
  int? id;
  String? name;
  int? height;
  int? weight;
  List<PokemonType>? types;
  Sprites? sprites;

  Pokemon({
    this.id,
    this.name,
    this.height,
    this.weight,
    this.types,
    this.sprites,
  });

  Pokemon copyWith({
    int? id,
    String? name,
    int? height,
    int? weight,
    List<PokemonType>? types,
    Sprites? sprites,
  }) =>
      Pokemon(
        id: id ?? this.id,
        name: name ?? this.name,
        height: height ?? this.height,
        weight: weight ?? this.weight,
        types: types ?? this.types,
        sprites: sprites ?? this.sprites,
      );
}
