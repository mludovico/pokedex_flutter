abstract class Urls {
  static const String _API = 'api';
  static const String _VERSION = 'v2';
  static const String RESOURCE = '$_API/$_VERSION/pokemon';

  static const String _PROD_SERVER = 'https://pokeapi.co';

  static const ACTIVE_SERVER = Urls._PROD_SERVER;
}
