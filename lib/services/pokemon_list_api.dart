import 'dart:convert';

import 'package:pokedex/models/pokemons_list_model.dart';
import 'package:http/http.dart' as http;

class PokemonListApi {
  Map mapResponse = {};
  List<PokemonListModel> PokemonList = [];
  late PokemonListModel pokemon;
  String url = "https://pokeapi.co/api/v2/pokemon/?offset=0&limit=1281";
  Future<List<PokemonListModel>> apiCall() async {
    http.Response response;
    response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      mapResponse = jsonDecode(response.body);
      for (int i = 0; i < 1281; i++) {
        pokemon = PokemonListModel(
          imageUrl:
              "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/dream-world/${i + 1}.svg",
          name: mapResponse['results'][i]['name'],
        );
        
        PokemonList.add(pokemon);
      }
      return PokemonList;
    } else {
      return PokemonList;
    }
  }
}
