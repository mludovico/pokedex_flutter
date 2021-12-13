import 'package:flutter/material.dart';
import 'package:pokedex/app/pokedex_detail/presenter/ui/pokemon_detail_page.dart';
import 'package:pokedex/app/pokedex_list/presenter/ui/pokedex_list_page.dart';
import 'package:pokedex/app/shared/widgets/error_page.dart';

abstract class RouteGenerator {
  static const LIST = '/';
  static const DETAIL = '/details';

  static Map<String, Widget Function(BuildContext)> staticRoutes = {
    LIST: (context) => PokedexListPage(),
  };

  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case LIST:
        return MaterialPageRoute(builder: (context) => PokedexListPage());
      case DETAIL:
        return MaterialPageRoute(
          builder: (context) => PokemonDetailPage(),
          settings: RouteSettings(
            name: settings.name,
            arguments: settings.arguments,
          ),
        );
      default:
        return MaterialPageRoute(builder: (context) => ErrorPage());
    }
  }

  static List<Route<dynamic>> generateInitialRoutes(String routeName) {
    final initialRoutes = <Route<dynamic>>[];
    initialRoutes
        .add(MaterialPageRoute(builder: (context) => PokedexListPage()));
    final regex = RegExp(r'^\/detail\/\d{0,4}$');
    if (regex.hasMatch(routeName)) {
      initialRoutes.add(
        MaterialPageRoute(
          builder: (context) => PokemonDetailPage(),
          settings: RouteSettings(
            name: routeName,
            arguments: routeName.split('/').last,
          ),
        ),
      );
    }
    return initialRoutes;
  }
}
