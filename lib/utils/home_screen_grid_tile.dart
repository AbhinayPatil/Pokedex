import 'package:flutter/material.dart';
import 'package:pokedex/screens/berries_list_screen.dart';
import 'package:pokedex/screens/evolutions_list_screen.dart';
import 'package:pokedex/screens/moves_list_screen.dart';
import 'package:pokedex/screens/pokemon_list_screen.dart';

class HomeScreenGridTile extends StatelessWidget {
  String category;
  Color tileColor;
  String imagePath;
  int index;
  HomeScreenGridTile({
    super.key,
    required this.imagePath,
    required this.index,
    required this.tileColor,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 2.0),
      child: InkWell(
        onTap: () {
          switch (index) {
            case 0:
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PokemonListScreen()));
              break;
            case 1:
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MovesListScreen()));
              break;
            case 2:
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const EvolutionsListScreen()));
              break;
            case 3:
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const BerriesListScreen()));
              break;
            default:
              print("error");
          }
        },
        child: Stack(
          children: [
            Positioned(
              top: 15,
              right: 5,
              left: 5,
              child: Container(
                height: 60,
                width: 200,
                decoration: BoxDecoration(
                  color: tileColor,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(
                      20,
                    ),
                  ),
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      category,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Image.asset(
                imagePath,
                scale: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
