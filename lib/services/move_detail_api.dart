import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokedex/models/move_detail_model.dart';

class MoveDetailApi {
  Map mapResponse = {};
  String url = "https://pokeapi.co/api/v2/move/";
  late MoveDetailModel move;

  Future<MoveDetailModel> apiCall(int index) async {
    http.Response response;
    url = "https://pokeapi.co/api/v2/move/$index";
    response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      mapResponse = jsonDecode(response.body);
        move = MoveDetailModel(
        mapResponse['name'], //name
        mapResponse['type']['name'], //type
        mapResponse['damage_class']['name'], //damage_class
        mapResponse['power'],
        mapResponse['accuracy'],
        mapResponse['pp'],
        mapResponse['meta']['healing'],
      );
    }
    return move;
  }
}
