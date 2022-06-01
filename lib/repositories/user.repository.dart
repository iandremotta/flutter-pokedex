import 'dart:convert';

import 'package:consume/models/pokedex.model.dart';
import 'package:dio/dio.dart';

class PokedexRepository {
  Dio _dio = Dio();
  final baseUrl =
      'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json';

  Future<Pokedex> getAllPokemons() async {
    Response response = await _dio.get(baseUrl);
    return Pokedex.fromJson(jsonDecode(response.data));
  }
}
