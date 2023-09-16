import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemons_list_model.dart';
import 'package:pokedex/services/pokemon_list_api.dart';

import '../utils/pokemon_list_tile.dart';

class PokemonListScreen extends StatefulWidget {
  const PokemonListScreen({super.key});

  @override
  State<PokemonListScreen> createState() => _PokemonListScreenState();
}

class _PokemonListScreenState extends State<PokemonListScreen> {
  List<PokemonListModel> pokemons = [];

  //call to api function
  Future<void> _fetchPokemons() async {
    PokemonListApi method = PokemonListApi();
    pokemons = await method.apiCall();
    // print("${pokemons[1].name} ------------ ${pokemons[2].name}");
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    _fetchPokemons();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: const Text(
          "Pokémons",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height * .9,
        child: (pokemons.isEmpty)
            ? const Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  itemCount: 1281,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: MediaQuery.of(context).size.width ~/ 120,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    return PokemonListTile(
                      index: index + 1,
                      imageUrl: pokemons[index].imageUrl,
                      name: pokemons[index].name,
                    );
                  },
                ),
              ),
      ),
    );
  }
}
