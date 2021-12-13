import 'package:flutter/material.dart';
import 'package:pokedex/app/shared/constants/app_theme.dart';
import 'package:pokedex/services/routing/route_generator.dart';
import 'package:pokedex/services/setup_locators.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocators();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightAppTheme,
      title: 'Pokedex',
      routes: RouteGenerator.staticRoutes,
      onGenerateRoute: RouteGenerator.generateRoutes,
      onGenerateInitialRoutes: RouteGenerator.generateInitialRoutes,
    );
  }
}
