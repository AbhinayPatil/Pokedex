import 'dart:convert';

import 'package:pokedex/models/berry_details.dart';
import 'package:http/http.dart' as http;

class BerryDetailApi {
  Map mapResponse1 = {};
  Map mapResponse2 = {};
  List<String> flavorList = [];
  late BerryDetails berryDetail;

  Future<BerryDetails> apiCall(int index) async {
    String url1 = "https://pokeapi.co/api/v2/berry/$index";
    http.Response response1;
    http.Response response2;
    response1 = await http.get(Uri.parse(url1));
    mapResponse1 = jsonDecode(response1.body);
    String url2 = mapResponse1['item']['url'];
    response2 = await http.get(Uri.parse(url2));
    mapResponse2 = jsonDecode(response2.body);

    if (response1.statusCode == 200 && response2.statusCode == 200) {
      _fetchBerryFlavors;
      berryDetail = BerryDetails(
        category: mapResponse2['category']['name'],
        cost: mapResponse2['cost'],
        effect: mapResponse2['effect_entries']['effect'],
        firmness: mapResponse1['firmness']['name'],
        flavors: flavorList,
        growthTime: mapResponse1['growth_time'],
        id: mapResponse1['id'],
        naturalGiftPower: mapResponse1['natural_gift_power'],
        naturalGiftType: mapResponse1['natural_gift_type'],
      );

      return berryDetail;
    } else {
      return berryDetail;
    }
  }

  void _fetchBerryFlavors() {
    var list = mapResponse1['flavors'];
    list.forEach((listItem) {
      if (listItem['potency'] != 0) {
        flavorList.add(listItem['flavour']['name']);
      }
    });
  }
}
