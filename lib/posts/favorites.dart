import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Define una clase para el estado que deseas compartir
class PokemonList extends ChangeNotifier {
  List<Map<String, dynamic>> _favoritePokemons = [];

  List<Map<String, dynamic>> get favoritePokemons => _favoritePokemons;

  void addPokemon(Map<String, dynamic> pokemon) {
    bool duplicated = false;
    for (var p in _favoritePokemons) {
      if (p['name'] == pokemon['name']) {
        duplicated = true;
        break;
      }
    }
    if (!duplicated) {
      _favoritePokemons.add(pokemon);
      notifyListeners();
    }
  }

  void removePokemon(int index) {
    _favoritePokemons.removeAt(index);
    notifyListeners();
  }
}

class MyFavorites extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pokemonList = Provider.of<PokemonList>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Mis favoritos',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          color: Colors.black,
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.maybePop(context);
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: pokemonList.favoritePokemons.asMap().entries.map((entry) {
          int index = entry.key;
          Map<String, dynamic> pokemon = entry.value;
          double topPosition = index * 90.0;
          return Positioned(
            top: topPosition,
            left: 50,
            right: 50,
            child: Container(
              height: 75,
              decoration: BoxDecoration(
                color: pokemon['color'],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    pokemon['image'],
                    height: 40,
                    width: 40,
                  ),
                  SizedBox(width: 5),
                  Text(
                    pokemon['name'],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 5),
                  GestureDetector(
                    onTap: () {
                      pokemonList.removePokemon(index);
                    },
                    child: Image.asset(
                      'assets/delete.png',
                      height: 30,
                      width: 30,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}