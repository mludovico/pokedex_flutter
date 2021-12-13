class PokedexException implements Exception {}

class DatasourceError extends PokedexException {}

class NotFound extends PokedexException {}

class ParserError extends PokedexException {}
