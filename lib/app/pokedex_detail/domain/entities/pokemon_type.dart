class PokemonType {
  int? slot;
  String? type;

  PokemonType({this.slot, this.type});

  PokemonType copyWith({int? slot, String? type}) => PokemonType(
        slot: slot ?? this.slot,
        type: type ?? this.type,
      );
}
