import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pokedex/app/pokedex_detail/domain/entities/pokemon_type.dart';
import 'package:pokedex/app/pokedex_detail/presenter/stores/pokemon_detail_store.dart';
import 'package:pokedex/app/pokedex_detail/presenter/ui/widgets/info_row.dart';
import 'package:pokedex/app/pokedex_detail/presenter/ui/widgets/picture_carousel.dart';

class PokemonDetailPage extends StatefulWidget {
  const PokemonDetailPage({Key? key}) : super(key: key);

  @override
  _PokemonDetailPageState createState() => _PokemonDetailPageState();
}

class _PokemonDetailPageState extends State<PokemonDetailPage> {
  late final int id;
  final store = PokemonDetailStore();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    id = ModalRoute.of(context)?.settings.arguments as int;
    store.initPokemon(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/pokeapi_logo.png',
          fit: BoxFit.cover,
        ),
        centerTitle: true,
      ),
      body: Observer(
        builder: (_) {
          if (store.error != null) {
            return Center(
              child: Text(store.error!),
            );
          }
          if (store.loading) {
            return Center(
              child: Image.asset('assets/pokeball_loading.gif'),
            );
          }
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                PictureCarousel(pokemon: store.pokemon!),
                SizedBox(height: 24),
                InfoRow(label: 'Nome: ', value: '${store.pokemon?.name}'),
                InfoRow(label: 'ID: ', value: '${store.pokemon?.id}'),
                InfoRow(label: 'Altura: ', value: '${store.pokemon?.height}'),
                InfoRow(label: 'Peso: ', value: '${store.pokemon?.weight}'),
                for (PokemonType type in store.pokemon?.types ?? [])
                  InfoRow(label: 'Tipo: ', value: '${type.type}'),
                SizedBox(height: 24),
                ElevatedButton(
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(const Size(0, 40)),
                    backgroundColor:
                        MaterialStateProperty.resolveWith((states) {
                      if (states.contains(MaterialState.disabled)) {
                        return Theme.of(context).primaryColor.withAlpha(90);
                      }
                      return Theme.of(context).primaryColor;
                    }),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  onPressed: store.toggleCapture,
                  child: store.catchToggleLoading
                      ? SizedBox(
                          height: 25,
                          width: 25,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(Colors.white),
                          ),
                        )
                      : Text(store.catchButtonLabel),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
