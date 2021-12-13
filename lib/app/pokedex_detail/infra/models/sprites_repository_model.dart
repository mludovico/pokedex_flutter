import 'dart:convert';

import 'package:pokedex/app/pokedex_detail/domain/entities/sprites.dart';

class SpritesRepositoryModel extends Sprites {
  SpritesRepositoryModel({
    String? main,
    String? front,
    String? back,
  }) : super(
          main: main,
          front: front,
          back: back,
        );

  factory SpritesRepositoryModel.fromMap(Map<String, dynamic> map) =>
      SpritesRepositoryModel(
        main: map['other']?['official-artwork']?['front_default'],
        front: map['front_default'],
        back: map['back_default'],
      );

  factory SpritesRepositoryModel.fromJson(String json) =>
      SpritesRepositoryModel.fromMap(jsonDecode(json));

  Map<String, dynamic> toMap() => {
        'other': {
          'official-artwork': {'front_default': main}
        },
        'front_default': front,
        'back_default': back,
      };

  String toJson() => jsonEncode(toMap());

  @override
  String toString() => toMap().toString();
}
