import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pokedex/app/pokedex_list/presenter/stores/pokedex_list_store.dart';
import 'package:pokedex/helpers/extensions.dart';
import 'package:pokedex/services/routing/route_generator.dart';

class PokedexListPage extends StatefulWidget {
  @override
  _PokedexListPageState createState() => _PokedexListPageState();
}

class _PokedexListPageState extends State<PokedexListPage> {
  final store = PokedexListStore();
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Observer(
          builder: (_) {
            if (store.searchEnabled) {
              return TextField(
                onChanged: store.search,
                controller: controller,
                decoration: InputDecoration(
                  suffixIcon: TextButton(
                    child: Text('Limpar'),
                    onPressed: () {
                      controller.clear();
                      store.search('');
                    },
                  ),
                ),
              );
            } else {
              return Image.asset('assets/pokeapi_logo.png');
            }
          },
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: store.toggleSearchBar,
            icon: Icon(store.searchEnabled ? Icons.close : Icons.search),
          ),
        ],
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
          if (store.list.isEmpty) {
            return Center(
              child: Text('Nenhum Pokemon encontrado...'),
            );
          }
          return ListView.builder(
            itemCount: store.list.length,
            itemBuilder: (_, index) {
              final url = store.list[index].url;
              final uri = Uri.tryParse(url?.substring(0, url.length - 1) ?? '');
              final id = int.tryParse(uri?.pathSegments.last ?? 'x');
              return ListTile(
                onTap: id == null
                    ? null
                    : () async {
                        await Navigator.of(context).pushNamed(
                          RouteGenerator.DETAIL,
                          arguments: id,
                        );
                        store.initList();
                      },
                leading: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.asset(
                    'assets/poke-ball.png',
                    color: store.caughtList.contains(id) ? null : Colors.grey,
                    colorBlendMode: BlendMode.color,
                  ),
                ),
                title: Text(store.list[index].name?.capitalize() ?? ''),
                trailing: store.caughtList.contains(id)
                    ? Icon(
                        Icons.check_circle_outline,
                        color: Colors.green,
                      )
                    : null,
              );
            },
          );
        },
      ),
    );
  }
}
