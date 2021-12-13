// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_detail_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PokemonDetailStore on _PokemonDetailStore, Store {
  Computed<String>? _$catchButtonLabelComputed;

  @override
  String get catchButtonLabel => (_$catchButtonLabelComputed ??=
          Computed<String>(() => super.catchButtonLabel,
              name: '_PokemonDetailStore.catchButtonLabel'))
      .value;

  final _$loadingAtom = Atom(name: '_PokemonDetailStore.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$errorAtom = Atom(name: '_PokemonDetailStore.error');

  @override
  String? get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String? value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  final _$pokemonAtom = Atom(name: '_PokemonDetailStore.pokemon');

  @override
  Pokemon? get pokemon {
    _$pokemonAtom.reportRead();
    return super.pokemon;
  }

  @override
  set pokemon(Pokemon? value) {
    _$pokemonAtom.reportWrite(value, super.pokemon, () {
      super.pokemon = value;
    });
  }

  final _$catchToggleLoadingAtom =
      Atom(name: '_PokemonDetailStore.catchToggleLoading');

  @override
  bool get catchToggleLoading {
    _$catchToggleLoadingAtom.reportRead();
    return super.catchToggleLoading;
  }

  @override
  set catchToggleLoading(bool value) {
    _$catchToggleLoadingAtom.reportWrite(value, super.catchToggleLoading, () {
      super.catchToggleLoading = value;
    });
  }

  final _$initPokemonAsyncAction =
      AsyncAction('_PokemonDetailStore.initPokemon');

  @override
  Future<void> initPokemon(int id) {
    return _$initPokemonAsyncAction.run(() => super.initPokemon(id));
  }

  final _$_capturePokemonAsyncAction =
      AsyncAction('_PokemonDetailStore._capturePokemon');

  @override
  Future<void> _capturePokemon() {
    return _$_capturePokemonAsyncAction.run(() => super._capturePokemon());
  }

  @override
  String toString() {
    return '''
loading: ${loading},
error: ${error},
pokemon: ${pokemon},
catchToggleLoading: ${catchToggleLoading},
catchButtonLabel: ${catchButtonLabel}
    ''';
  }
}
