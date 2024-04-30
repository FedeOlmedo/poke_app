class Bulbasaur {
  final String name;
  final List<Map<String, dynamic>> gameIndices;
  final int attack;
  final int defense;
  final int hp;
  final String type;
  final int gameIndex;

  Bulbasaur({
    required this.name,
    required this.gameIndices,
    required this.defense,
    required this.attack,
    required this.hp,
    required this.type,
    required this.gameIndex,
  });

  factory Bulbasaur.fromJson(Map<String, dynamic> json) {
    final List<dynamic> types = json['types'];
    String pokemonType = '';
    if (types.isNotEmpty) {
      pokemonType = types[0]['type']['name'];
    }

    final List<dynamic> indices = json['game_indices'];
    int pokemonGameIndex = -1; // Valor predeterminado si no encuentra
    for (final index in indices) {
      if (index['version']['name'] == 'silver') {
        pokemonGameIndex = index['game_index'];
        break;
      }
    }

    return Bulbasaur(
      name: json['name'],
      gameIndices: List<Map<String, dynamic>>.from(json['game_indices']),
      defense: json['stats'][2]['base_stat'],
      attack: json['stats'][1]['base_stat'],
      hp: json['stats'][0]['base_stat'],
      type: pokemonType,
      gameIndex: pokemonGameIndex,
    );
  }
}


class Charmeleon {
  final String name;
  final List<Map<String, dynamic>> gameIndices;
  final int attack;
  final int defense;
  final int hp;
  final String type;
  final int gameIndex;

  Charmeleon({
    required this.name,
    required this.gameIndices,
    required this.defense,
    required this.attack,
    required this.hp,
    required this.type,
    required this.gameIndex,
  });

  factory Charmeleon.fromJson(Map<String, dynamic> json) {
    final List<dynamic> types = json['types'];
    String pokemonType = '';
    if (types.isNotEmpty) {
      pokemonType = types[0]['type']['name'];
    }

    final List<dynamic> indices = json['game_indices'];
    int pokemonGameIndex = -1;
    for (final index in indices) {
      if (index['version']['name'] == 'gold') {
        pokemonGameIndex = index['game_index'];
        break;
      }
    }

    return Charmeleon(
      name: json['name'],
      gameIndices: List<Map<String, dynamic>>.from(json['game_indices']),
      defense: json['stats'][2]['base_stat'],
      attack: json['stats'][1]['base_stat'],
      hp: json['stats'][0]['base_stat'],
      type: pokemonType,
      gameIndex: pokemonGameIndex,
    );
  }
}


class PokemonForm {
  final String name;
  final String url;

  PokemonForm({required this.name, required this.url});

  factory PokemonForm.fromJson(Map<String, dynamic> json) {
    return PokemonForm(
      name: json['name'],
      url: json['url'],
    );
  }
}
