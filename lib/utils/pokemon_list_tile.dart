import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PokemonListTile extends StatelessWidget {
  int index;
  String imageUrl;
  String name;
  PokemonListTile(
      {super.key,
      required this.index,
      required this.imageUrl,
      required this.name});
  @override
  Widget build(BuildContext context) {
    int r = (index * 10) % 255;
    int g = (index * 15) % 255;
    int b = (index * 20) % 255;
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(200, r, g, b),
        borderRadius: const BorderRadius.all(
          Radius.circular(
            20,
          ),
        ),
      ),
      child: Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.end,
        children: [
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 80,
                width: 80,
                child: SvgPicture.network(
                  imageUrl,
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
          ),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
