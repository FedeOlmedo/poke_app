import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:poke_app/model/models.dart';


class ApiService {
  Future<Bulbasaur?> getBulbasaur(String pokemonName) async {
    final response = await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/1/')); //$pokemonId

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return Bulbasaur.fromJson(jsonData);
    } else {
      throw Exception('Error al cargar datos: ${response.statusCode}');
    }
  }

  Future<String?> fetchBulbasaurImage(String pokemonName) async {
    final response = await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/1/'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final bulbasaurImage = jsonData['sprites']['other']['official-artwork']['front_default'];
      return bulbasaurImage;
    } else {
      throw Exception('Failed to load dream world image');
    }
  }


  //CHARMELEON
  Future<Charmeleon?> getCharmeleon(String pokemonName) async {
    final response = await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/5/')); //$pokemonId

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return Charmeleon.fromJson(jsonData);
    } else {
      throw Exception('Error al cargar datos: ${response.statusCode}');
    }
  }

  Future<String?> fetchCharmeleonImage(String pokemonName) async {
    final response = await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/5/'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final charmeleonImage = jsonData['sprites']['other']['official-artwork']['front_default'];
      return charmeleonImage;
    } else {
      throw Exception('Failed to load dream world image');
    }
  }
}


//   Future<String> getCharmeleonInfo(String pokemonName) async {
//     final response = await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/5/'));
//
//     if (response.statusCode == 200) {
//       // Si la solicitud es exitosa, parsea la respuesta JSON
//       final jsonData = json.decode(response.body);
//       // Obtiene la lista de resultados
//       List<dynamic> results = jsonData['results'];
//       // Itera sobre la lista de resultados para encontrar el nombre del Pokémon
//       for (var result in results) {
//         if (result['name'] == pokemonName) {
//           return result['name'];
//         }
//       }
//       // Si no se encuentra el Pokémon, devuelve null
//       return "NULL";
//     } else {
//       // Si la solicitud falla, lanza una excepción
//       throw Exception('Error al cargar datos: ${response.statusCode}');
//     }
//   }
// }