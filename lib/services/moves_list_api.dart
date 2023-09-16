import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokedex/models/moves_list_model.dart';

class MovesListApi {
  List<MovesListModel> moves = [];
  Map mapResponse = {};
  late MovesListModel move;
  String url = "https://pokeapi.co/api/v2/move?offset=0&limit=918";

  Future<List<MovesListModel>> apiCall() async {
    http.Response response;
    response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      mapResponse = jsonDecode(response.body);
      for (int i = 0; i < 918; i++) {
        String moveName = mapResponse['results'][i]['name'];
        String detailUrl = mapResponse['results'][i]['url'];
        move = MovesListModel(
          detailUrl: detailUrl,
          name: moveName,
        );
        moves.add(move);
      }
    }
    return moves;
  }
}
