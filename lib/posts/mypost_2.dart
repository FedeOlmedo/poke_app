import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'favorites.dart';
import '../model/models.dart';
import 'package:poke_app/services/api.dart';

class MyPost2 extends StatelessWidget {
  final ApiService _apiService = ApiService();
  final String pokemonName;

  MyPost2({required this.pokemonName});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _apiService.getCharmeleon('1'),
      builder: (context, AsyncSnapshot<Charmeleon?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(); // cosito de carga
        } else if (snapshot.hasError) {
          return Text(
              'Error: ${snapshot.error}');
        } else if (snapshot.hasData) {
          final pokemon = snapshot.data!;
          return Scaffold(
            backgroundColor: Color.fromARGB(255, 255, 102, 14),
            body: Stack(
              children: [
                //WHITE BOX CONTAINER
                Positioned(
                  top: 380,
                  left: 50,
                  right: 50,
                  // bottom: 50,
                  child: Container(
                    width: 300,
                    height: 250,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 70,
                          left: 35,
                          width: 95,
                          height: 40,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: Colors.black12,
                                width: 1,
                              ),
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  top: 12,
                                  right: 15,
                                  child: Center(
                                    child: Text(
                                      pokemon != null ? pokemon.attack.toString() : 'NULL',
                                      style: TextStyle(
                                        color: Colors.black54,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 9, // Tamaño del texto
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 0,
                                  bottom: 0,
                                  left: 0,
                                  width: 50,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 255, 102, 14),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        'Attack',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 9,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top: 120,
                          left: 35,
                          width: 95,
                          height: 40,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                    color: Colors.black12, width: 1)),
                            child: Stack(
                              children: [
                                Positioned(
                                  top: 12,
                                  right: 15,
                                  child: Center(
                                    child: Text(
                                      pokemon != null ? pokemon.hp.toString() : 'NULL',
                                      style: TextStyle(
                                        color: Colors.black54,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 9,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 0,
                                  bottom: 0,
                                  left: 0,
                                  width: 50,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 255, 102, 14),
                                        borderRadius: BorderRadius.circular(5)),
                                    child: const Center(
                                      child: Text(
                                        'HP',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 9,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top: 70,
                          right: 35,
                          width: 95,
                          height: 40,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                    color: Colors.black12, width: 1)),
                            child: Stack(
                              children: [
                                Positioned(
                                  top: 12,
                                  right: 15,
                                  child: Center(
                                    child: Text(
                                      pokemon != null ? pokemon.defense.toString() : 'NULL',
                                      style: TextStyle(
                                        color: Colors.black54,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 9, // Tamaño del texto
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 0,
                                  bottom: 0,
                                  left: 0,
                                  width: 50,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 255, 102, 14),
                                        borderRadius: BorderRadius.circular(5)),
                                    child: const Center(
                                      child: Text(
                                        'Defense',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 9,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top: 120,
                          right: 35,
                          width: 95,
                          height: 40,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                    color: Colors.black12, width: 1)),
                            child: Stack(
                              children: [
                                Positioned(
                                  top: 12.5,
                                  right: 16,
                                  child: Center(
                                    child: Text(
                                      pokemon != null ? pokemon.type : 'NULL',
                                      style: TextStyle(
                                        color: Colors.black54,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 9, // Tamaño del texto
                                      ),
                                    ),
                                  ),
                                ),

                                // Otros elementos dentro del cuadro
                                Positioned(
                                  top: 0,
                                  left: 0,
                                  bottom: 0,
                                  width: 50,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: const Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        'Type: ',
                                        style: TextStyle(
                                          color: Colors.black54,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 9,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 20,
                          left: 35,
                          right: 35,
                          child: ElevatedButton(
                            onPressed: () {
                              final selectedPokemon = {
                                'name': pokemon != null ? pokemon.name : 'NULL',
                                'color': Color.fromARGB(255, 255, 102, 14),
                                'image': 'assets/charm.png',
                              };
                              final pokemonList = Provider.of<PokemonList>(
                                  context,
                                  listen: false);
                              pokemonList.addPokemon(selectedPokemon);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MyFavorites()));
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black54,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            child: const Text(
                              'Yo te elijo!',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                //IMAGEN
                Positioned(
                  top: 200,
                  left: 35,
                  right: 35,
                  child: FutureBuilder(
                    future: _apiService.fetchCharmeleonImage('charmeleon'),
                    builder: (context, AsyncSnapshot<String?> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else if (snapshot.hasData) {
                        final bulbImageURL = snapshot.data!;
                        return Image.network(
                          bulbImageURL,
                          width: 250,
                          height: 250,
                        );
                      } else {
                        return Text('No se pudo cargar la imagen');
                      }
                    },
                  ),
                ),

                //HEADER1
                Positioned(
                  top: 140,
                  left: 50,
                  child: Text(
                    'Pokemon nro ${pokemon != null ? pokemon.gameIndex.toString() : 'NULL'}',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),

                //HEADER2
                Positioned(
                  top: 155,
                  left: 50,
                  child: Text(
                    pokemon != null ? pokemon.name : 'NULL',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),

                //FAV SECTION
                Positioned(
                  top: 75,
                  right: 50,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyFavorites()));
                    },
                    child: Row(
                      children: [
                        const Text(
                          'Mis favoritos',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 5),
                        // Espacio entre el texto y la imagen
                        Image.asset(
                          'assets/faviconpng.png',
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return Text(
              'No se encontró el Pokémon');
        }
      },
    );
  }
}
