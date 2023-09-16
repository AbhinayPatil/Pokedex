import 'package:flutter/material.dart';
import 'package:pokedex/utils/home_screen_grid_tile.dart';
import 'package:pokedex/utils/home_screen_search_bar.dart';

import '../utils/video_section.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  TextEditingController _controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 32,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                "assets/images/menu.png",
                color: Colors.white,
                scale: 15,
              ),
              const SizedBox(
                height: 32,
              ),
              const Text(
                "What Pokémon are you looking for?",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              HomeScreenSearchBar(controller: _controller),
              const SizedBox(
                height: 24,
              ),
              SizedBox(
                height: 200,
                child: GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 2),
                  children: [
                    HomeScreenGridTile(
                      imagePath: "assets/images/pokeball.png",
                      index: 0,
                      tileColor: Colors.red,
                      category: "Pokémon",
                    ),
                    HomeScreenGridTile(
                      imagePath: "assets/images/bolt.png",
                      index: 1,
                      tileColor: Colors.amber,
                      category: "Moves",
                    ),
                    HomeScreenGridTile(
                      imagePath: "assets/images/dna.png",
                      index: 2,
                      tileColor: Colors.green.shade400,
                      category: "Evolutions",
                    ),
                    HomeScreenGridTile(
                      imagePath: "assets/images/berry.png",
                      index: 3,
                      tileColor: Colors.purple.shade200,
                      category: "Berries",
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20,),
              // VideoSection(),
            ],
          ),
        ),
      ),
    );
  }
}
