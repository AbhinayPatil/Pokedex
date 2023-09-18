import 'package:flutter/material.dart';
import 'package:pokedex/models/move_detail_model.dart';
import 'package:pokedex/models/moves_list_model.dart';

class MoveDetailWidget extends StatelessWidget {
  MoveDetailModel move;
  MoveDetailWidget({required this.move});
  @override
  Widget build(BuildContext context) {
    Color bg = Colors.amber;
    if (move.type == "normal") {
      bg = Colors.blueGrey.shade300;
    } else if (move.type == "fighting") {
      bg = Colors.redAccent.shade700;
    } else if (move.type == "flying") {
      bg = Colors.indigoAccent;
    } else if (move.type == "poison") {
      bg = Colors.purple;
    } else if (move.type == "ground") {
      bg = Colors.brown;
    } else if (move.type == "rock") {
      bg = const Color.fromARGB(255, 139, 97, 97);
    } else if (move.type == "bug") {
      bg = Colors.green;
    } else if (move.type == "ghost") {
      bg = Colors.purpleAccent.shade700;
    } else if (move.type == "steel") {
      bg = Colors.grey.shade600;
    } else if (move.type == "fire") {
      bg = Colors.red.shade900;
    } else if (move.type == "water") {
      bg = Colors.blue;
    } else if (move.type == "grass") {
      bg = Colors.green.shade700;
    } else if (move.type == "electric") {
      bg = Colors.yellow.shade700;
    } else if (move.type == "psychic") {
      bg = Colors.pink.shade800;
    } else if (move.type == "ice") {
      bg = Colors.cyan;
    } else if (move.type == "dragon") {
      bg = const Color.fromARGB(255, 145, 117, 34);
    } else if (move.type == "dark") {
      bg = Colors.black87;
    } else if (move.type == "fairy") {
      bg = Colors.pink.shade300;
    } else if (move.type == "unknown" || move.type == "shadow") {
      bg = Colors.black87;
    }

    return Dialog(
      backgroundColor: bg,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0)), //this right here
      child: Builder(
        builder: (context) => SizedBox(
            height: 200,
            width: 20,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    move.name,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 18.0,
                    ),
                    child: Divider(
                      thickness: 3,
                      color: Colors.white24,
                    ),
                  ),
                  Text(
                    "Type: ${move.type}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    "Class: ${move.damage_class}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    "Power: ${move.power}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    "Accuracy: ${move.accuracy}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    "PP: ${move.pp}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    "Healing: ${move.healing}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
