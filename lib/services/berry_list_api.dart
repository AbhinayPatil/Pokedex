import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokedex/models/berries_list_model.dart';

class BerryListApi {
  List<BerriesListModel> berries = [];
  Map mapResponse = {};
  late BerriesListModel berry;
  String url = "https://pokeapi.co/api/v2/berry/?offset=0&limit=64";

  Future<List<BerriesListModel>> apiCall() async {
    http.Response response;
    response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      mapResponse = jsonDecode(response.body);
      for (int i = 0; i < 64; i++) {
        String berryName = mapResponse['results'][i]['name'];
        String imageUrl =
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/items/$berryName-berry.png";
        berry = BerriesListModel(
          imageUrl: imageUrl,
          name: berryName,
        );
        berries.add(berry);
      }
      return berries;
    } else {
      return berries;
    }
  }
}
