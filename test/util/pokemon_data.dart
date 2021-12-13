const POKEMON_DATA = {
  "id": 1,
  "name": "bulbasaur",
  "height": 7,
  "weight": 69,
  "sprites": SPRITES_DATA,
  "types": TYPES_DATA,
};

const POKEMON_DATA_WITH_NULLS = {
  "id": null,
  "name": null,
  "height": null,
  "weight": null,
  "sprites": null,
  "types": null,
};

const SPRITES_DATA = {
  "back_default":
      "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/1.png",
  "front_default":
      "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png",
  "other": {
    "official-artwork": {
      "front_default":
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png",
    },
  },
};

const SPRITES_DATA_WITH_NULLS = {
  "back_default": null,
  "front_default": null,
  "other": null,
};

const SPRITES_DATA_WITH_INNER_NULL1 = {
  "back_default":
      "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/1.png",
  "front_default":
      "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png",
  "other": {
    "official-artwork": null,
  },
};

const SPRITES_DATA_WITH_INNER_NULL2 = {
  "back_default":
      "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/1.png",
  "front_default":
      "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png",
  "other": {
    "official-artwork": {
      "front_deafult": null,
    },
  },
};

const TYPES_DATA = [
  {
    "slot": 1,
    "type": {
      "name": "grass",
      "url": "https://pokeapi.co/api/v2/type/12/",
    }
  },
  {
    "slot": 2,
    "type": {
      "name": "poison",
      "url": "https://pokeapi.co/api/v2/type/4/",
    }
  }
];

const TYPES_DATA_WITH_NULLS = [
  {
    "slot": null,
    "type": null,
  },
  {
    "slot": null,
    "type": {
      "name": null,
      "url": null,
    }
  }
];
